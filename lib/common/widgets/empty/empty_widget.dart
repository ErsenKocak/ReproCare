import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reprocare/core/constants/colors/app_light_colors.dart';
import 'package:reprocare/core/constants/font_weight/app_font_weight.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';
import 'package:reprocare/core/extensions/sized_box/sized_box_extension.dart';
import 'package:reprocare/generated/assets.gen.dart';
import 'package:reprocare/generated/locale_keys.g.dart';

class AppEmptyWidget extends StatelessWidget {
  const AppEmptyWidget({super.key, this.title, this.subTitle});
  final String? title;
  final String? subTitle;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Assets.icons.emptyWidget.icEmptyWidget.svg(
            width: 0.80.sw,
          ),
          24.h.sbxh,
          Text(
            title ?? LocaleKeys.ErrorMessages_EmptyWidgetInfo.tr(),
            textAlign: TextAlign.center,
            style: AppThemes.currentTheme.textTheme.bodyLarge?.copyWith(
              fontWeight: AppFontWeight.medium.value,
            ),
          ),
          12.h.sbxh,
          Text(
            subTitle ?? '',
            textAlign: TextAlign.center,
            style: AppThemes.currentTheme.textTheme.bodySmall
                ?.copyWith(color: AppLightColors.secondaryTextColor),
          ),
        ],
      ),
    );
  }
}
