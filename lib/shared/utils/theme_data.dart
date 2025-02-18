import 'package:flutter/material.dart';
import 'package:shoppings_app/shared/extensions/hex_color.dart';

class AppColors {
  static final Color onSurface = HexColor.fromHex('#1D1B20');
  static final Color subtlePurple = HexColor.fromHex('#E8DEF8');
  static final Color mutedPurple = HexColor.fromHex('#4F378A');
  static final Color primary = HexColor.fromHex('#65558F');
}

class ThemeConfigs {
  static ThemeData themeData() => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
          ),
        ),
      );
}
