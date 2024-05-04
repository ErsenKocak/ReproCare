import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reprocare/core/constants/colors/app_dark_colors.dart';
import 'package:reprocare/core/constants/colors/app_light_colors.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';

class AppSwitch extends StatelessWidget {
  final bool isChecked;
  final Color checkColor;
  final Color unCheckedColor;
  final Function() onChanged;

  const AppSwitch({
    super.key,
    required this.isChecked,
    required this.onChanged,
    this.checkColor = AppLightColors.primaryColor,
    this.unCheckedColor = AppLightColors.lightGrey,
  });

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: isChecked ? checkColor : unCheckedColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        width: 40.w,
        height: 22.w,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(1.w),
              child: AnimatedAlign(
                duration: const Duration(milliseconds: 200),
                alignment:
                    isChecked ? Alignment.centerRight : Alignment.centerLeft,
                child: SizedBox(
                  width: 20.w,
                  height: 22.w,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppThemes.brightness == Brightness.light
                          ? AppLightColors.white
                          : AppDarkColors.secondaryDarkColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
