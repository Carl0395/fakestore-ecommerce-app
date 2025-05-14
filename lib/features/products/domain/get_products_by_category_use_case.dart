import 'package:dartz/dartz.dart';
import 'package:fake_store_package/fake_store_package.dart';
import 'package:fake_store_package/models/product_model.dart';
import 'package:fake_store_package/util/failures.dart';

class GetProductsByCategoryUseCase {
  Future<Either<Failure, List<ProductModel>>> call(String category) async {
    return await FakeStorePackage.getProductsByCategory(category);
  }
}
