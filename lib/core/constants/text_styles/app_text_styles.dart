import 'package:flutter/material.dart';
import 'package:reprocare/core/constants/colors/app_dark_colors.dart';
import 'package:reprocare/core/constants/colors/app_light_colors.dart';
import 'package:reprocare/core/constants/font_family/app_font_family.dart';
import 'package:reprocare/core/constants/font_weight/app_font_weight.dart';
import 'package:reprocare/core/constants/text_types/app_text_types.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';

class AppTextStyle {
  static TextStyle getStyle({
    String? fontFamily,
    TextStyle? textStyle,
    AppFontWeight? fontWeight = AppFontWeight.medium,
    bool muted = false,
    bool xMuted = false,
    double? letterSpacing,
    Color? color,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double? wordSpacing,
    double? fontSize,
  }) {
    return TextStyle(
      fontFamily: fontFamily ?? AppFontFamily.Montserrat.value,
      fontSize: fontSize,
      fontWeight: fontWeight?.value,
      letterSpacing: letterSpacing,
      color: color ??
          AppThemes.getColorByBrightness(
            lightColor: AppLightColors.dark1000,
            darkColor: AppDarkColors.white,
          ),
      decoration: decoration,
      height: height,
      wordSpacing: wordSpacing,
    );
  }

  static TextStyle displayLarge({
    String? fontFamily,
    TextStyle? textStyle,
    AppFontWeight? fontWeight = AppFontWeight.medium,
    bool muted = false,
    bool xMuted = false,
    double? letterSpacing,
    Color? color,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double? wordSpacing,
    double? fontSize,
  }) {
    return getStyle(
      fontFamily: fontFamily,
      fontSize: fontSize ?? AppTextType.displayLarge.fontSize,
      color: color,
      height: height,
      muted: muted,
      letterSpacing: letterSpacing,
      fontWeight: fontWeight,
      decoration: decoration,
      textStyle: textStyle,
      wordSpacing: wordSpacing,
      xMuted: xMuted,
    );
  }

  static TextStyle displayMedium({
    String? fontFamily,
    TextStyle? textStyle,
    AppFontWeight? fontWeight = AppFontWeight.medium,
    bool muted = false,
    bool xMuted = false,
    double? letterSpacing,
    Color? color,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double? wordSpacing,
    double? fontSize,
  }) {
    return getStyle(
      fontFamily: fontFamily,
      fontSize: fontSize ?? AppTextType.displayMedium.fontSize,
      color: color,
      height: height,
      muted: muted,
      letterSpacing: letterSpacing,
      fontWeight: fontWeight,
      decoration: decoration,
      textStyle: textStyle,
      wordSpacing: wordSpacing,
      xMuted: xMuted,
    );
  }

  static TextStyle displaySmall({
    String? fontFamily,
    TextStyle? textStyle,
    AppFontWeight? fontWeight = AppFontWeight.medium,
    bool muted = false,
    bool xMuted = false,
    double? letterSpacing,
    Color? color,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double? wordSpacing,
    double? fontSize,
  }) {
    return getStyle(
      fontFamily: fontFamily,
      fontSize: fontSize ?? AppTextType.displaySmall.fontSize,
      color: color,
      height: height,
      muted: muted,
      letterSpacing: letterSpacing,
      fontWeight: fontWeight,
      decoration: decoration,
      textStyle: textStyle,
      wordSpacing: wordSpacing,
      xMuted: xMuted,
    );
  }

  static TextStyle headlineLarge({
    String? fontFamily,
    TextStyle? textStyle,
    AppFontWeight? fontWeight = AppFontWeight.medium,
    bool muted = false,
    bool xMuted = false,
    double? letterSpacing,
    Color? color,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double? wordSpacing,
    double? fontSize,
  }) {
    return getStyle(
      fontFamily: fontFamily,
      fontSize: fontSize ?? AppTextType.headlineLarge.fontSize,
      color: color,
      height: height,
      muted: muted,
      letterSpacing: letterSpacing,
      fontWeight: fontWeight,
      decoration: decoration,
      textStyle: textStyle,
      wordSpacing: wordSpacing,
      xMuted: xMuted,
    );
  }

  static TextStyle headlineMedium({
    String? fontFamily,
    TextStyle? textStyle,
    AppFontWeight? fontWeight = AppFontWeight.medium,
    bool muted = false,
    bool xMuted = false,
    double? letterSpacing,
    Color? color,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double? wordSpacing,
    double? fontSize,
  }) {
    return getStyle(
      fontFamily: fontFamily,
      fontSize: fontSize ?? AppTextType.headlineMedium.fontSize,
      color: color,
      height: height,
      muted: muted,
      letterSpacing: letterSpacing,
      fontWeight: fontWeight,
      decoration: decoration,
      textStyle: textStyle,
      wordSpacing: wordSpacing,
      xMuted: xMuted,
    );
  }

  static TextStyle headlineSmall({
    String? fontFamily,
    TextStyle? textStyle,
    AppFontWeight? fontWeight = AppFontWeight.medium,
    bool muted = false,
    bool xMuted = false,
    double? letterSpacing,
    Color? color,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double? wordSpacing,
    double? fontSize,
  }) {
    return getStyle(
      fontFamily: fontFamily,
      fontSize: fontSize ?? AppTextType.headlineSmall.fontSize,
      color: color,
      height: height,
      muted: muted,
      letterSpacing: letterSpacing,
      fontWeight: fontWeight,
      decoration: decoration,
      textStyle: textStyle,
      wordSpacing: wordSpacing,
      xMuted: xMuted,
    );
  }

  static TextStyle titleLarge({
    String? fontFamily,
    TextStyle? textStyle,
    AppFontWeight? fontWeight = AppFontWeight.medium,
    bool muted = false,
    bool xMuted = false,
    double? letterSpacing,
    Color? color,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double? wordSpacing,
    double? fontSize,
  }) {
    return getStyle(
      fontFamily: fontFamily,
      fontSize: fontSize ?? AppTextType.titleLarge.fontSize,
      color: color,
      height: height,
      muted: muted,
      letterSpacing: letterSpacing,
      fontWeight: fontWeight,
      decoration: decoration,
      textStyle: textStyle,
      wordSpacing: wordSpacing,
      xMuted: xMuted,
    );
  }

  static TextStyle titleMedium({
    String? fontFamily,
    TextStyle? textStyle,
    AppFontWeight? fontWeight = AppFontWeight.medium,
    bool muted = false,
    bool xMuted = false,
    double? letterSpacing,
    Color? color,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double? wordSpacing,
    double? fontSize,
  }) {
    return getStyle(
      fontFamily: fontFamily,
      fontSize: fontSize ?? AppTextType.titleMedium.fontSize,
      color: color,
      height: height,
      muted: muted,
      letterSpacing: letterSpacing,
      fontWeight: fontWeight,
      decoration: decoration,
      textStyle: textStyle,
      wordSpacing: wordSpacing,
      xMuted: xMuted,
    );
  }

  static TextStyle titleSmall({
    String? fontFamily,
    TextStyle? textStyle,
    AppFontWeight? fontWeight = AppFontWeight.medium,
    bool muted = false,
    bool xMuted = false,
    double? letterSpacing,
    Color? color,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double? wordSpacing,
    double? fontSize,
  }) {
    return getStyle(
      fontFamily: fontFamily,
      fontSize: fontSize ?? AppTextType.titleSmall.fontSize,
      color: color,
      height: height,
      muted: muted,
      letterSpacing: letterSpacing,
      fontWeight: fontWeight,
      decoration: decoration,
      textStyle: textStyle,
      wordSpacing: wordSpacing,
      xMuted: xMuted,
    );
  }

  static TextStyle labelLarge({
    String? fontFamily,
    TextStyle? textStyle,
    AppFontWeight? fontWeight = AppFontWeight.medium,
    bool muted = false,
    bool xMuted = false,
    double? letterSpacing,
    Color? color,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double? wordSpacing,
    double? fontSize,
  }) {
    return getStyle(
      fontFamily: fontFamily,
      fontSize: fontSize ?? AppTextType.labelLarge.fontSize,
      color: color,
      height: height,
      muted: muted,
      letterSpacing: letterSpacing,
      fontWeight: fontWeight,
      decoration: decoration,
      textStyle: textStyle,
      wordSpacing: wordSpacing,
      xMuted: xMuted,
    );
  }

  static TextStyle labelMedium({
    String? fontFamily,
    TextStyle? textStyle,
    AppFontWeight? fontWeight = AppFontWeight.medium,
    bool muted = false,
    bool xMuted = false,
    double? letterSpacing,
    Color? color,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double? wordSpacing,
    double? fontSize,
  }) {
    return getStyle(
      fontFamily: fontFamily,
      fontSize: fontSize ?? AppTextType.labelMedium.fontSize,
      color: color,
      height: height,
      muted: muted,
      letterSpacing: letterSpacing,
      fontWeight: fontWeight,
      decoration: decoration,
      textStyle: textStyle,
      wordSpacing: wordSpacing,
      xMuted: xMuted,
    );
  }

  static TextStyle labelSmall({
    String? fontFamily,
    TextStyle? textStyle,
    AppFontWeight? fontWeight = AppFontWeight.medium,
    bool muted = false,
    bool xMuted = false,
    double? letterSpacing,
    Color? color,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double? wordSpacing,
    double? fontSize,
  }) {
    return getStyle(
      fontFamily: fontFamily,
      fontSize: fontSize ?? AppTextType.labelSmall.fontSize,
      color: color,
      height: height,
      muted: muted,
      letterSpacing: letterSpacing,
      fontWeight: fontWeight,
      decoration: decoration,
      textStyle: textStyle,
      wordSpacing: wordSpacing,
      xMuted: xMuted,
    );
  }

  static TextStyle bodyLarge({
    String? fontFamily,
    TextStyle? textStyle,
    AppFontWeight? fontWeight = AppFontWeight.medium,
    bool muted = false,
    bool xMuted = false,
    double? letterSpacing,
    Color? color,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double? wordSpacing,
    double? fontSize,
  }) {
    return getStyle(
      fontFamily: fontFamily,
      fontSize: fontSize ?? AppTextType.bodyLarge.fontSize,
      color: color,
      height: height,
      muted: muted,
      letterSpacing: letterSpacing,
      fontWeight: fontWeight,
      decoration: decoration,
      textStyle: textStyle,
      wordSpacing: wordSpacing,
      xMuted: xMuted,
    );
  }

  static TextStyle bodyMedium({
    String? fontFamily,
    TextStyle? textStyle,
    AppFontWeight? fontWeight = AppFontWeight.medium,
    bool muted = false,
    bool xMuted = false,
    double? letterSpacing,
    Color? color,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double? wordSpacing,
    double? fontSize,
  }) {
    return getStyle(
      fontFamily: fontFamily,
      fontSize: fontSize ?? AppTextType.bodyMedium.fontSize,
      color: color,
      height: height,
      muted: muted,
      letterSpacing: letterSpacing,
      fontWeight: fontWeight,
      decoration: decoration,
      textStyle: textStyle,
      wordSpacing: wordSpacing,
      xMuted: xMuted,
    );
  }

  static TextStyle bodySmall({
    String? fontFamily,
    TextStyle? textStyle,
    AppFontWeight? fontWeight = AppFontWeight.medium,
    bool muted = false,
    bool xMuted = false,
    double? letterSpacing,
    Color? color,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double? wordSpacing,
    double? fontSize,
  }) {
    return getStyle(
      fontFamily: fontFamily,
      fontSize: fontSize ?? AppTextType.bodySmall.fontSize,
      color: color,
      height: height,
      muted: muted,
      letterSpacing: letterSpacing,
      fontWeight: fontWeight,
      decoration: decoration,
      textStyle: textStyle,
      wordSpacing: wordSpacing,
      xMuted: xMuted,
    );
  }
}
