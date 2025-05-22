import 'dart:ui';

import 'package:fake_e_commerce/core/extensions/hex_to_color_extension.dart';

class AppThemeConfig {
  final Color primaryColor;
  final Color secondaryColor;
  final Color tertiaryColor;
  final Color backgroundColor;
  final Color textTitle;
  final Color textSubtitle;
  final Color textLabel;
  final Color textBody;
  final Color textButton;
  final Color primaryButton;
  final Color secondaryButton;
  final Color border;
  final Color disableColor;
  final Color disableOption;
  final Color inputColor;
  final Color placeholder;
  final Color placeholderError;
  final Color borderGreen;
  final Color borderGrey;
  final Color borderRed;
  final Color inputError;
  final Color textError;
  final Color warning;
  final Color error;
  final Color ratingColor;

  AppThemeConfig({
    required this.primaryColor,
    required this.secondaryColor,
    required this.tertiaryColor,
    required this.backgroundColor,
    required this.textTitle,
    required this.textSubtitle,
    required this.textLabel,
    required this.textBody,
    required this.textButton,
    required this.primaryButton,
    required this.secondaryButton,
    required this.border,
    required this.disableColor,
    required this.disableOption,
    required this.inputColor,
    required this.placeholder,
    required this.placeholderError,
    required this.borderGreen,
    required this.borderGrey,
    required this.borderRed,
    required this.inputError,
    required this.textError,
    required this.warning,
    required this.error,
    required this.ratingColor,
  });

  factory AppThemeConfig.fromJson(Map<String, dynamic> json) {
    return AppThemeConfig(
      primaryColor: json['primaryColor'].toString().hexToColor(),
      secondaryColor: json['secondaryColor'].toString().hexToColor(),
      tertiaryColor: json['tertiaryColor'].toString().hexToColor(),
      backgroundColor: json['backgroundColor'].toString().hexToColor(),
      textTitle: json['textTitle'].toString().hexToColor(),
      textSubtitle: json['textSubtitle'].toString().hexToColor(),
      textLabel: json['textLabel'].toString().hexToColor(),
      textBody: json['textBody'].toString().hexToColor(),
      textButton: json['textButton'].toString().hexToColor(),
      primaryButton: json['primaryButton'].toString().hexToColor(),
      secondaryButton: json['secondaryButton'].toString().hexToColor(),
      border: json['border'].toString().hexToColor(),
      disableColor: json['disableColor'].toString().hexToColor(),
      disableOption: json['disableOption'].toString().hexToColor(),
      inputColor: json['inputColor'].toString().hexToColor(),
      placeholder: json['placeholder'].toString().hexToColor(),
      placeholderError: json['placeholderError'].toString().hexToColor(),
      borderGreen: json['borderGreen'].toString().hexToColor(),
      borderGrey: json['borderGrey'].toString().hexToColor(),
      borderRed: json['borderRed'].toString().hexToColor(),
      inputError: json['inputError'].toString().hexToColor(),
      textError: json['textError'].toString().hexToColor(),
      warning: json['warning'].toString().hexToColor(),
      error: json['error'].toString().hexToColor(),
      ratingColor: json['ratingColor'].toString().hexToColor(),
    );
  }
}
