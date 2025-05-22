import 'package:ecommerce_system_design/molecules/cart_item.dart';
import 'package:ecommerce_system_design/organisms/cart_list.dart';
import 'package:fake_e_commerce/core/extensions/widget_ref_parametrized_extension.dart';
import 'package:fake_e_commerce/features/cart/presentation/providers/cart_provider.dart';
import 'package:fake_e_commerce/features/products/presentation/providers/products_provider.dart';
import 'package:fake_store_package/models/product_quantity_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _defaultCart = '1';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartData = ref.watch(getCartByIdProvider(_defaultCart));
    return Scaffold(
      appBar: AppBar(title: Text(ref.text.cart), centerTitle: false),
      body: cartData.when(
        data:
            (data) => CartList<ProductQuantityModel>(
              data: data.products ?? [],
              cartItemBuilder: (context, cartItem) {
                final product = ref.watch(
                  getProductByIdProvider(cartItem.productId ?? 1),
                );
                return product.when(
                  data: (data) {
                    return CartItem(
                      key: Key('cart_item_${data?.id}'),
                      title: data?.title,
                      urlImage: data?.image,
                      count: cartItem.quantity,
                      id: data?.id?.toString(),
                      price: data?.price?.toString(),
                      titleColor: ref.theme.primaryColor,
                    );
                  },
                  error: (error, stackTrace) => CartItem(),
                  loading: () => CartItem(),
                );
              },
            ),
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
