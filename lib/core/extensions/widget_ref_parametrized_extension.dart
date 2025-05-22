import 'package:fake_e_commerce/core/app_config/app_config.dart';
import 'package:fake_e_commerce/core/app_config/app_config_provider.dart';
import 'package:fake_e_commerce/core/app_config/app_text_config.dart';
import 'package:fake_e_commerce/core/app_config/app_theme_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension ConfigRefExtension on WidgetRef {
  AppConfig get config => watch(appConfigProvider);
  AppTextConfig get text => config.text;
  AppThemeConfig get theme => config.theme;
}
