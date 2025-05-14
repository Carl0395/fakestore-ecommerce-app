import 'package:dartz/dartz.dart';
import 'package:fake_store_package/fake_store_package.dart';
import 'package:fake_store_package/util/failures.dart';

class LoginUseCase {
  Future<Either<Failure, String>> call(String username, String password) async {
    return await FakeStorePackage.login(username: username, password: password);
  }
}
