import 'package:dartz/dartz.dart';
import 'package:fake_store_package/fake_store_package.dart';
import 'package:fake_store_package/util/failures.dart';
import 'package:fake_store_package/util/http_helper.dart';

class LoginUseCase {
  Future<Either<Failure, String>> call(String username, String password) async {
    FakeStorePackage fakeStorePackage = FakeStorePackage(HttpHelper());
    return await fakeStorePackage.login(username: username, password: password);
  }
}
