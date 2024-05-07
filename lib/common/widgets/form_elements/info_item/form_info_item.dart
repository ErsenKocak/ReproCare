import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reprocare/common/widgets/svg_picture/app_svg_picture.dart';
import 'package:reprocare/core/constants/colors/app_dark_colors.dart';
import 'package:reprocare/core/constants/colors/app_light_colors.dart';
import 'package:reprocare/core/constants/font_weight/app_font_weight.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';
import 'package:reprocare/core/enums/app_padding/app_padding.dart';
import 'package:reprocare/core/extensions/sized_box/sized_box_extension.dart';
import 'package:reprocare/generated/assets.gen.dart';
import 'package:reprocare/generated/locale_keys.g.dart';

class FormInfoItem extends StatelessWidget {
  const FormInfoItem({super.key, required this.infoText});
  final String infoText;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppThemes.getColorByBrightness(
          lightColor: AppLightColors.formInfoBackground,
          darkColor: AppDarkColors.secondaryDarkColor),
      padding: context.paddingAllHigh3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoHeader,
          4.h.sbxh,
          _buildInfoText,
        ],
      ),
    );
  }

  Widget get _buildInfoHeader {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        AppSvgPicture(path: Assets.icons.general.iconInfo.path),
        8.w.sbxw,
        Text(
          LocaleKeys.Global_Information.tr(),
          style: AppThemes.currentTheme.textTheme.bodySmall
              ?.copyWith(fontWeight: AppFontWeight.medium.value),
        )
      ],
    );
  }

  Widget get _buildInfoText {
    return Text(
      '"${infoText}"',
      style: AppThemes.currentTheme.textTheme.labelSmall?.copyWith(
          fontWeight: AppFontWeight.medium.value,
          color: AppLightColors.formInfoText),
    );
  }
}
