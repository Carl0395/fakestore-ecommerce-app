import 'package:fake_e_commerce/core/di.dart';
import 'package:fake_e_commerce/features/products/presentation/providers/category_provider.dart';
import 'package:fake_e_commerce/features/products/presentation/providers/filter_query_provider.dart';
import 'package:fake_store_package/models/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<ProductModel>> getProducts(Ref ref) async {
  final useCase = ref.watch(getProductsUseCaseProvider);
  final data = await useCase();
  return data.fold((failure) => throw failure, (data) => data);
}

@riverpod
Future<List<String>> getCategories(Ref ref) async {
  final useCase = ref.watch(getCategoriesUseCaseProvider);
  final data = await useCase();
  return data.fold((failure) => throw failure, (data) {
    data.insert(0, allCategory);
    return data;
  });
}

@riverpod
Future<List<ProductModel>> getProductsByCategoryAndQuery(Ref ref) async {
  final currenCategory = ref.watch(currentCategoryProvider);
  final query = ref.watch(filterQueryProvider);

  if (currenCategory == allCategory) {
    final useCase = ref.watch(getProductsUseCaseProvider);
    final data = await useCase();
    return data.fold(
      (failure) => throw failure,
      (data) => filterByQuery(query, data),
    );
  }
  final useCase = ref.watch(getProductsByCategoryUseCaseProvider);
  final data = await useCase(currenCategory);
  return data.fold(
    (failure) => throw failure,
    (data) => filterByQuery(query, data),
  );
}

List<ProductModel> filterByQuery(String query, List<ProductModel> products) {
  return products.where((item) {
    final containsTitle = (item.title ?? '').toLowerCase().contains(
      query.toLowerCase(),
    );
    final containsDescription = (item.description ?? '').toLowerCase().contains(
      query.toLowerCase(),
    );
    return containsTitle || containsDescription;
  }).toList();
}

@Riverpod(keepAlive: true)
Future<ProductModel?> getProductById(Ref ref, int id) async {
  final products = await ref.watch(getProductsProvider.future);
  final index = products.indexWhere((item) => item.id == id);
  if (index != -1) {
    return products[index];
  }

  return null;
}
