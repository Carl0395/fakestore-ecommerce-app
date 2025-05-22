import 'dart:ui';

extension HexToColorExtension on String {
  Color hexToColor() {
    String hex = this;
    hex = hex.replaceAll('#', '');
    if (hex.length == 6) hex = 'FF$hex';
    return Color(int.parse(hex, radix: 16));
  }
}
