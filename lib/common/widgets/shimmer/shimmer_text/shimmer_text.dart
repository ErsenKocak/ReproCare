import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reprocare/core/constants/colors/app_dark_colors.dart';
import 'package:reprocare/core/constants/colors/app_light_colors.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';
import 'package:shimmer_pro/shimmer_pro.dart';

class AppShimmerText extends StatelessWidget {
  const AppShimmerText({
    super.key,
    this.width,
    required this.maxLine,
    this.borderRadius,
    this.alignment,
  });

  final int maxLine;
  final double? width;
  final double? borderRadius;
  final Alignment? alignment;
  @override
  Widget build(BuildContext context) {
    return ShimmerPro.text(
      scaffoldBackgroundColor: AppThemes.getColorByBrightness(
        lightColor: AppLightColors.shimmerColor,
        darkColor: AppDarkColors.primaryColor,
      ),
      light: AppThemes.brightness == Brightness.light
          ? ShimmerProLight.darker
          : ShimmerProLight.lighter,
      duration: Duration(seconds: 3),
      width: width ?? 100.sw,
      maxLine: maxLine,
      alignment: alignment ?? Alignment.centerLeft,
      textSize: 12.sp,
    );
  }
}
