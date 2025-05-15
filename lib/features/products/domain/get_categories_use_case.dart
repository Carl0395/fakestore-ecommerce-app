import 'package:dartz/dartz.dart';
import 'package:fake_store_package/fake_store_package.dart';
import 'package:fake_store_package/util/failures.dart';
import 'package:fake_store_package/util/http_helper.dart';

class GetCategoriesUseCase {
  Future<Either<Failure, List<String>>> call() async {
    FakeStorePackage fakeStorePackage = FakeStorePackage(HttpHelper());
    return await fakeStorePackage.getCategories();
  }
}
