import 'package:flutter/material.dart';

enum AppFontWeight {
  extraBold,
  bold,
  semiBold,
  medium,
  regular,
  light,
  extraLight,
}

extension AppFontWeightValue on AppFontWeight {
  FontWeight get value {
    switch (this) {
      case AppFontWeight.extraBold:
        return FontWeight.w800;
      case AppFontWeight.bold:
        return FontWeight.bold;
      case AppFontWeight.semiBold:
        return FontWeight.w600;
      case AppFontWeight.medium:
        return FontWeight.w500;
      case AppFontWeight.regular:
        return FontWeight.w400;
      case AppFontWeight.light:
        return FontWeight.w300;
      case AppFontWeight.extraLight:
        return FontWeight.w200;
      default:
        return FontWeight.normal;
    }
  }
}
