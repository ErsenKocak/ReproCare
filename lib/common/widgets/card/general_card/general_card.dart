import 'package:flutter/material.dart';
import 'package:reprocare/core/constants/colors/app_dark_colors.dart';
import 'package:reprocare/core/constants/colors/app_light_colors.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';

class GeneralCard extends StatelessWidget {
  const GeneralCard({
    super.key,
    required this.child,
    this.margin,
    this.borderRadius,
    this.elevation,
  });
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final double? elevation;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation != null
          ? elevation
          : AppThemes.brightness == Brightness.light
              ? 0.3
              : 0,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(4),
      ),
      color: AppThemes.brightness == Brightness.light
          ? AppLightColors.white
          : AppDarkColors.secondaryDarkColor,
      child: child,
      margin: margin,
    );
  }
}
