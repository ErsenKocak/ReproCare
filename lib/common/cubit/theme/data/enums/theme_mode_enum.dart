import 'package:flutter/material.dart';

enum ThemeModeEnum { Light, Dark }

extension MateralThemeModeByThemeModeEnum on ThemeModeEnum {
  ThemeMode get materialThemeMode {
    switch (this) {
      case ThemeModeEnum.Light:
        return ThemeMode.light;

      case ThemeModeEnum.Dark:
        return ThemeMode.dark;
    }
  }
}
