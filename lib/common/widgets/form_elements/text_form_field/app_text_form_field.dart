import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reprocare/core/constants/colors/app_dark_colors.dart';
import 'package:reprocare/core/constants/colors/app_light_colors.dart';
import 'package:reprocare/core/constants/font_weight/app_font_weight.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';

class AppTextFormField extends StatelessWidget {
  AppTextFormField({
    super.key,
    this.headerText,
    this.headerInfoText,
    this.controller,
    this.inputFormatters,
    this.validator,
    this.onChanged,
    this.hintText,
    this.obscureText = false,
    this.enabled = true,
    this.keyboardType,
    this.suffixIcon,
    this.focusNode,
    this.prefixIcon,
    this.borderRadiusValue,
  });

  final String? headerText;
  final String? headerInfoText;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String? text)? validator;
  final void Function(String)? onChanged;
  final String? hintText;
  final bool? obscureText;
  final bool? enabled;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  double? borderRadiusValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      inputFormatters: inputFormatters,
      cursorColor: AppThemes.brightness == Brightness.light
          ? AppLightColors.primaryTextColor
          : AppDarkColors.white,
      cursorWidth: 1,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscureText!,
      keyboardType: keyboardType,
      style: AppThemes.currentTheme.textTheme.bodyMedium,
      autofocus: false,
      textInputAction: TextInputAction.next,
      enabled: enabled,
      onChanged: onChanged,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppThemes.brightness == Brightness.light
            ? AppLightColors.white
            : AppDarkColors.secondaryDarkColor,
        hintText: hintText,
        hintStyle: AppThemes.currentTheme.textTheme.bodySmall?.copyWith(
          color: AppLightColors.secondaryTextColor,
          fontWeight: AppFontWeight.medium.value,
        ),
        contentPadding:
            EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.5.h),
        errorStyle: AppThemes.currentTheme.textTheme.bodySmall?.copyWith(
          color: AppLightColors.auxiliaryRed,
          overflow: TextOverflow.visible,
        ),
        errorMaxLines: 5,
        border: _border(AppLightColors.strokeGrey),
        focusedBorder: _border(
          AppThemes.brightness == Brightness.light
              ? AppLightColors.strokeGrey
              : Colors.transparent,
        ),
        enabledBorder: _border(
          AppThemes.brightness == Brightness.light
              ? AppLightColors.strokeGrey
              : Colors.transparent,
        ),
        disabledBorder: _border(
          AppThemes.brightness == Brightness.light
              ? AppLightColors.strokeGrey
              : Colors.transparent,
        ),
        errorBorder: _errorBorder,
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: prefixIcon,
              )
            : null,
        suffixIcon: suffixIcon,
        prefixIconConstraints: BoxConstraints(
          minWidth: 110.w,
          minHeight: 0,
        ),
      ),
    );
  }

  OutlineInputBorder _border(final Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(width: 1.0, color: color),
      borderRadius: BorderRadius.circular(borderRadiusValue ?? 24),
    );
  }

  OutlineInputBorder get _errorBorder {
    return OutlineInputBorder(
      borderSide: BorderSide(width: 1.0, color: AppLightColors.auxiliaryRed),
      borderRadius: BorderRadius.circular(borderRadiusValue ?? 24),
    );
  }
}
