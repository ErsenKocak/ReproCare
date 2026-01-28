import 'package:flutter/material.dart';
import 'package:reprocare/common/widgets/text/app_text.dart';
import 'package:reprocare/core/constants/colors/app_dark_colors.dart';
import 'package:reprocare/core/constants/colors/app_light_colors.dart';
import 'package:reprocare/core/constants/font_weight/app_font_weight.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';
import 'package:reprocare/core/extensions/null_check/null_check_extension.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    required this.title,
    this.subTitle,
    super.key,
  });
  final String title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppText.titleSmall(
          title,
          fontWeight: AppFontWeight.bold,
          maxLines: 5,
          overflow: TextOverflow.visible,
        ),
        if (subTitle.isNotNullAndEmpty)
          AppText.bodySmall(
            subTitle!,
            color: AppThemes.getColorByBrightness(
              lightColor: AppLightColors.dark700,
              darkColor: AppDarkColors.dark400,
            ),
          ),
      ],
    );
  }
}
