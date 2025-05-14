import 'package:fake_e_commerce/core/di.dart';
import 'package:fake_store_package/models/cart_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_provider.g.dart';

@Riverpod(keepAlive: true)
Future<CartModel> getCartById(Ref ref, String id) async {
  final useCase = ref.watch(getCartByIdUseCaseProvider);
  final data = await useCase(id);

  return data.fold((failure) => throw failure, (data) => data);
}
