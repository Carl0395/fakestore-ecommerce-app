import 'package:fake_e_commerce/core/app_config/app_text_config.dart';
import 'package:fake_e_commerce/core/app_config/app_theme_config.dart';

class AppConfig {
  final AppTextConfig text;
  final AppThemeConfig theme;

  AppConfig({required this.text, required this.theme});

  factory AppConfig.fromJson(Map<String, dynamic> json) {
    return AppConfig(
      text: AppTextConfig.fromJson(json['text']),
      theme: AppThemeConfig.fromJson(json['theme']),
    );
  }
}
