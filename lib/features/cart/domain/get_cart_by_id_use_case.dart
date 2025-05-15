import 'package:dartz/dartz.dart';
import 'package:fake_store_package/fake_store_package.dart';
import 'package:fake_store_package/models/cart_model.dart';
import 'package:fake_store_package/util/failures.dart';
import 'package:fake_store_package/util/http_helper.dart';

class GetCartByIdUseCase {
  Future<Either<Failure, CartModel>> call(String id) async {
    FakeStorePackage fakeStorePackage = FakeStorePackage(HttpHelper());
    return await fakeStorePackage.getCart(id);
  }
}
