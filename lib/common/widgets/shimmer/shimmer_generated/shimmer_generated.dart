import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reprocare/core/constants/colors/app_dark_colors.dart';
import 'package:reprocare/core/constants/colors/app_light_colors.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';
import 'package:shimmer_pro/shimmer_pro.dart';

class AppShimmerGenerated extends StatelessWidget {
  const AppShimmerGenerated({
    super.key,
    required this.borderRadius,
    required this.height,
    required this.child,
    this.scaffoldBackgroundColor,
  });

  final double borderRadius;
  final double height;
  final Widget child;
  final Color? scaffoldBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return ShimmerPro.generated(
      scaffoldBackgroundColor: scaffoldBackgroundColor ??
          AppThemes.getColorByBrightness(
            lightColor: AppLightColors.shimmerColor,
            darkColor: AppDarkColors.primaryColor,
          ),
      width: 100.sw,
      borderRadius: borderRadius,
      child: child,
      duration: Duration(seconds: 3),
      light: AppThemes.brightness == Brightness.light
          ? ShimmerProLight.darker
          : ShimmerProLight.lighter,
    );
  }
}
