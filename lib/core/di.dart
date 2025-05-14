import 'package:fake_e_commerce/features/account/domain/login_use_case.dart';
import 'package:fake_e_commerce/features/account/domain/register_use_case.dart';
import 'package:fake_e_commerce/features/cart/domain/get_cart_by_id_use_case.dart';
import 'package:fake_e_commerce/features/products/domain/get_categories_use_case.dart';
import 'package:fake_e_commerce/features/products/domain/get_products_by_category_use_case.dart';
import 'package:fake_e_commerce/features/products/domain/get_products_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'di.g.dart';

@riverpod
LoginUseCase getLoginUseCase(Ref ref) {
  return LoginUseCase();
}

@riverpod
RegisterUseCase getRegisterUseCase(Ref ref) {
  return RegisterUseCase();
}

@riverpod
GetProductsUseCase getProductsUseCase(Ref ref) {
  return GetProductsUseCase();
}

@riverpod
GetCategoriesUseCase getCategoriesUseCase(Ref ref) {
  return GetCategoriesUseCase();
}

@riverpod
GetProductsByCategoryUseCase getProductsByCategoryUseCase(Ref ref) {
  return GetProductsByCategoryUseCase();
}

@riverpod
GetCartByIdUseCase getCartByIdUseCase(Ref ref) {
  return GetCartByIdUseCase();
}
