import 'dart:math';

import 'package:flutter/material.dart';

class AppColors {
  static Color primary = const Color(0xFF38B983);
  static Color primary1 = const Color(0xFF38B983);
  static Color primary2 = const Color(0xFF38B983);
  static Color primary3 = const Color(0xFF38B983);
  static Color black = const Color(0xFF000000);
  static Color grey = const Color(0xFF484444);
  //TODO:Add more colors here

  //Generate Material color
  static MaterialColor generateMaterialColor(Color color) {
    int tintValue(int value, double factor) => max(0, min((value + ((255 - value) * factor)).round(), 255));

    Color tintColor(Color color, double factor) =>
        Color.fromRGBO(tintValue(color.red, factor), tintValue(color.green, factor), tintValue(color.blue, factor), 1);

    int shadeValue(int value, double factor) => max(0, min(value - (value * factor).round(), 255));

    Color shadeColor(Color color, double factor) =>
        Color.fromRGBO(shadeValue(color.red, factor), shadeValue(color.green, factor), shadeValue(color.blue, factor), 1);
    return MaterialColor(color.value, {
      50: tintColor(color, 0.9),
      100: tintColor(color, 0.8),
      200: tintColor(color, 0.6),
      300: tintColor(color, 0.4),
      400: tintColor(color, 0.2),
      500: color,
      600: shadeColor(color, 0.1),
      700: shadeColor(color, 0.2),
      800: shadeColor(color, 0.3),
      900: shadeColor(color, 0.4),
    });
  }
}
class AppStyle{
  static const String fontName = 'NotoSans';
  ThemeData lightTheme = ThemeData(

  );
}

/// Hex Color-code to Color [FFFFFF >>> Color(0xFFFFFFFF)]
extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
