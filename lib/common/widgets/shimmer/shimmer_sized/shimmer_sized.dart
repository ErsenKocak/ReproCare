import 'package:flutter/material.dart';
import 'package:reprocare/core/constants/colors/app_dark_colors.dart';
import 'package:reprocare/core/constants/colors/app_light_colors.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';
import 'package:shimmer_pro/shimmer_pro.dart';

class AppShimmerSized extends StatelessWidget {
  const AppShimmerSized({
    super.key,
    this.width,
    required this.height,
    required this.borderRadius,
    this.scaffoldBackgroundColor,
  });
  final double? width;
  final double height;
  final double borderRadius;
  final Color? scaffoldBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return ShimmerPro.sized(
      scaffoldBackgroundColor: scaffoldBackgroundColor ??
          AppThemes.getColorByBrightness(
            lightColor: AppLightColors.shimmerColor,
            darkColor: AppDarkColors.primaryColor,
          ),
      light: AppThemes.brightness == Brightness.light
          ? ShimmerProLight.darker
          : ShimmerProLight.lighter,
      height: height,
      width: width,
      borderRadius: borderRadius,
    );
  }
}
