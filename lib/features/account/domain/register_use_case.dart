import 'package:dartz/dartz.dart';
import 'package:fake_store_package/fake_store_package.dart';
import 'package:fake_store_package/models/user_model.dart';
import 'package:fake_store_package/util/failures.dart';
import 'package:fake_store_package/util/http_helper.dart';

class RegisterUseCase {
  Future<Either<Failure, int>> call({
    required String username,
    required String email,
    required String password,
  }) async {
    FakeStorePackage fakeStorePackage = FakeStorePackage(HttpHelper());
    final user = UserModel(
      email: email,
      password: password,
      username: username,
    );
    return await fakeStorePackage.createUser(user);
  }
}
