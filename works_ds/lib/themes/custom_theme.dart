import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CustomTheme {
  static ThemeData light() {
    return ThemeData(
      package: 'works_ds',
      brightness: Brightness.light,
      primaryColor: CustomColor.colorBrandPrimary,
      scaffoldBackgroundColor: CustomColor.colorWhite,
      fontFamily: CustomFonts.fontFamily01,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: CustomColor.colorNeutralDark02,
        ),
        foregroundColor: CustomColor.colorNeutralDark02,
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontFamily: CustomFonts.fontFamily01,
          package: 'works_ds',
          height: 1,
        ),
        bodyMedium: TextStyle(
          fontFamily: CustomFonts.fontFamily01,
          fontSize: CustomSizes.sizeS,
          package: 'works_ds',
          height: 1.4,
        ),
        bodySmall: TextStyle(
          fontFamily: CustomFonts.fontFamily01,
          fontSize: CustomSizes.sizeXS,
          package: 'works_ds',
          height: 1.4,
        ),
      ).apply(
        bodyColor: CustomColor.colorNeutralDark02,
      ),
    );
  }
}
