import 'package:flutter/material.dart';
import 'package:works_ds/constants/constants.dart';

extension UIThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  // Example:
  // Text(
  //   _title,
  //   style: context.h1,     <---
  // ),
  TextStyle? get h1 => theme.textTheme.titleLarge?.copyWith(
        fontSize: CustomSizes.sizeXXXL,
        fontWeight: FontWeight.w300,
      );
}
