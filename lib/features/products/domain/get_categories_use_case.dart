import 'package:dartz/dartz.dart';
import 'package:fake_store_package/fake_store_package.dart';
import 'package:fake_store_package/util/failures.dart';

class GetCategoriesUseCase {
  Future<Either<Failure, List<String>>> call() async {
    return await FakeStorePackage.getCategories();
  }
}
