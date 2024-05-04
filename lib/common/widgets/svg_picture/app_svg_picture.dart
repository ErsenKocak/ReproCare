import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reprocare/core/constants/colors/app_dark_colors.dart';
import 'package:reprocare/core/constants/colors/app_light_colors.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';

class AppSvgPicture extends StatelessWidget {
  const AppSvgPicture({
    super.key,
    required this.path,
    this.height,
    this.color,
    this.onTap,
  });
  final String path;
  final double? height;
  final Color? color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: onTap == null,
      child: GestureDetector(
        onTap: () => onTap != null ? onTap!() : null,
        child: SvgPicture.asset(
          path,
          color: color ??
              AppThemes.getColorByBrightness(
                lightColor: AppLightColors.black,
                darkColor: AppDarkColors.white,
              ),
          height: height ?? 20.h,
        ),
      ),
    );
  }
}
