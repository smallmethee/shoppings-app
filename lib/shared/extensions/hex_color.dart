import 'package:flutter/material.dart';

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String toHex({bool leadingHashSign = true, bool includeAlpha = false}) {
    final hexAlpha =
        includeAlpha ? a.toInt().toRadixString(16).padLeft(2, '0') : '';
    final hexColor = (r.toInt() << 16) | (g.toInt() << 8) | b.toInt();
    return '${leadingHashSign ? '#' : ''}$hexAlpha${hexColor.toRadixString(16).padLeft(6, '0')}';
  }
}
