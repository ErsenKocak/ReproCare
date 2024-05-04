import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reprocare/core/constants/colors/app_dark_colors.dart';
import 'package:reprocare/core/constants/colors/app_light_colors.dart';
import 'package:reprocare/core/constants/font_weight/app_font_weight.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';

class AppElevatedButton extends StatelessWidget {
  AppElevatedButton({
    super.key,
    this.onPressed,
    this.child,
    required this.buttonText,
    this.buttonColor,
    this.borderColor,
    this.textColor,
    this.borderRadius,
    this.isLong = true,
    this.fontSize,
  });

  final void Function()? onPressed;
  final Widget? child;
  final String buttonText;
  final Color? buttonColor;
  final Color? borderColor;
  final Color? textColor;
  final BorderRadiusGeometry? borderRadius;
  final bool? isLong;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: isLong == true
            ? Size(
                100.sw,
                52.h,
              )
            : null,
        backgroundColor: buttonColor ?? AppLightColors.primaryColor,
        disabledBackgroundColor: AppLightColors.gray100,
        side: BorderSide(
          width: 1,
          color: borderColor ?? Colors.transparent,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(42),
        ),
        elevation: 0,
      ),
      child: child ??
          Text(
            buttonText,
            style: AppThemes.currentTheme.textTheme.bodyMedium?.copyWith(
              fontWeight: AppFontWeight.semiBold.value,
              fontSize: fontSize,
              color: onPressed == null
                  ? AppLightColors.secondaryTextColor
                  : textColor != null
                      ? textColor
                      : AppLightColors.white,
              letterSpacing: 1.0,
            ),
          ),
    );
  }
}
