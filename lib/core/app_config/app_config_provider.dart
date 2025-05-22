import 'package:fake_e_commerce/core/app_config/app_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_config_provider.g.dart';

@riverpod
AppConfig appConfig(Ref ref) {
  throw UnimplementedError(); // Será sobrescrito en main
}
