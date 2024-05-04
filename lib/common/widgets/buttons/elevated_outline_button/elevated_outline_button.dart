import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reprocare/core/constants/colors/app_light_colors.dart';
import 'package:reprocare/core/constants/font_weight/app_font_weight.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';

class AppElevatedOutlineButton extends StatelessWidget {
  AppElevatedOutlineButton({
    super.key,
    this.onPressed,
    required this.buttonText,
    this.buttonColor,
    this.borderColor,
    this.textColor,
    this.borderRadius,
    this.isLong = true,
  });

  final void Function()? onPressed;
  final String buttonText;
  final Color? buttonColor;
  final Color? borderColor;
  final Color? textColor;
  final BorderRadiusGeometry? borderRadius;
  final bool? isLong;

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
        backgroundColor: buttonColor != null
            ? buttonColor
            : AppThemes.brightness == Brightness.light
                ? AppLightColors.white
                : Colors.transparent,
        disabledBackgroundColor: AppLightColors.gray100,
        side: BorderSide(
          width: 1,
          color: onPressed == null
              ? Colors.transparent
              : borderColor ?? AppLightColors.primaryColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(42),
        ),
        elevation: 0,
      ),
      child: Text(
        buttonText,
        style: AppThemes.currentTheme.textTheme.bodyMedium?.copyWith(
          fontWeight: AppFontWeight.semiBold.value,
          color: onPressed == null
              ? AppLightColors.secondaryTextColor
              : textColor ?? AppLightColors.primaryColor,
          letterSpacing: 1.0,
        ),
      ),
    );
  }
}
