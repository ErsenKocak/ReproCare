import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reprocare/core/constants/colors/app_light_colors.dart';
import 'package:reprocare/core/constants/font_family/app_font_family.dart';
import 'package:reprocare/core/constants/font_weight/app_font_weight.dart';

class AppTextStyles {
  static TextStyle generate({
    final double? fontSize,
    final Color? color,
    final AppFontWeight? fontWeight,
    final TextDecoration? decoration,
    final AppFontFamily? fontFamily,
  }) =>
      TextStyle(
        fontSize: fontSize?.sp ?? 12.sp,
        fontWeight: fontWeight?.value ?? AppFontWeight.regular.value,
        fontFamily: _buildFontFamily(
          fontFamily: fontFamily,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
        fontStyle: FontStyle.normal,
        letterSpacing: 0,
        color: color ?? AppLightColors.primaryTextColor,
        decoration: decoration ?? TextDecoration.none,
      );

  static String _buildFontFamily({
    double? fontSize = 12,
    AppFontWeight? fontWeight = AppFontWeight.regular,
    AppFontFamily? fontFamily = AppFontFamily.EuclidCircularB,
  }) {
    return fontFamily?.value ?? AppFontFamily.EuclidCircularB.value;
  }
}
