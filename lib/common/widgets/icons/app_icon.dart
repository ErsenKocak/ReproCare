import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reprocare/common/widgets/shadow/my_shadow.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({
    required this.icon,
    this.onTap,
    this.color,
    this.size,
    this.withContainer = false,
    super.key,
  });

  final IconData icon;
  final Function? onTap;
  final Color? color;
  final double? size;
  final bool? withContainer;
  @override
  Widget build(BuildContext context) {
    return withContainer! ? _buildContainer : _buildIcon;
  }

  Widget get _buildContainer {
    final MyShadow myShadow = MyShadow();
    return GestureDetector(
      onTap: () => onTap?.call(),
      child: Container(
        width: 36.w,
        height: 32.h,
        decoration: BoxDecoration(
          color: AppThemes.currentTheme.cardColor,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: myShadow.color ??
                  AppThemes.currentTheme.shadowColor.withAlpha(myShadow.alpha),
              spreadRadius: myShadow.spreadRadius,
              blurRadius: myShadow.blurRadius,
              offset: myShadow.offset!,
            ),
          ],
        ),
        child: _buildIcon,
      ),
    );
  }

  Widget get _buildIcon {
    return GestureDetector(
      onTap: () => onTap?.call(),
      child: Icon(
        icon,
        size: size ?? 16.sp,
        //TODO: Dark Theme
        color: color,
      ),
    );
  }
}
