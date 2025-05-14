import 'package:fake_e_commerce/core/route/routes.dart';
import 'package:fake_e_commerce/features/account/presentation/pages/login_page.dart';
import 'package:fake_e_commerce/features/account/presentation/pages/register_page.dart';
import 'package:fake_e_commerce/features/cart/presentation/pages/cart_page.dart';
import 'package:fake_e_commerce/features/products/presentation/pages/product/product_page.dart';
import 'package:fake_e_commerce/features/products/presentation/pages/products/products_page.dart';
import 'package:fake_store_package/models/product_model.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.products:
        return MaterialPageRoute(builder: (_) => ProductsPage());
      case Routes.productDetail:
        if (args is ProductModel) {
          return MaterialPageRoute(builder: (_) => ProductPage(product: args));
        }
        return MaterialPageRoute(builder: (_) => ProductsPage());
      case Routes.cart:
        return MaterialPageRoute(builder: (_) => CartPage());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => RegisterPage());
      default:
        return MaterialPageRoute(builder: (_) => ProductsPage());
    }
  }
}
