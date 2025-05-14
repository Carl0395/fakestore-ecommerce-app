import 'package:fake_e_commerce/core/di.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'account_provider.g.dart';

@riverpod
Future<String> signIn(Ref ref, String username, String password) async {
  final useCase = ref.watch(getLoginUseCaseProvider);
  final token = await useCase(username, password);
  return token.fold((failure) => throw failure, (token) => token);
}

@riverpod
Future<int> signUp(
  Ref ref,
  String username,
  String email,
  String password,
) async {
  final useCase = ref.watch(getRegisterUseCaseProvider);
  final data = await useCase(
    email: email,
    password: password,
    username: username,
  );
  return data.fold((failure) => throw failure, (data) => data);
}
