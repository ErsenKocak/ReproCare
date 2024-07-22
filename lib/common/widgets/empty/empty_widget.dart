import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reprocare/common/widgets/buttons/elevated_button/elevated_button.dart';
import 'package:reprocare/core/constants/colors/app_light_colors.dart';
import 'package:reprocare/core/constants/font_weight/app_font_weight.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';
import 'package:reprocare/core/extensions/sized_box/sized_box_extension.dart';
import 'package:reprocare/generated/assets.gen.dart';
import 'package:reprocare/generated/locale_keys.g.dart';

class AppEmptyWidget extends StatelessWidget {
  const AppEmptyWidget({
    super.key,
    this.title,
    this.subTitle,
    this.onPress,
    this.buttonText,
  }) // Eğer onPress verildiyse buttonText verilmesi zorunlu kılınıyor.
  : assert(onPress == null || buttonText != null);
  final String? title;
  final String? subTitle;
  final Function? onPress;
  final String? buttonText;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildIcon,
        24.h.sbxh,
        _buildTitle,
        12.h.sbxh,
        _buildSubTitle,
        _buildFooterButton
      ],
    );
  }

  Widget get _buildIcon {
    return Assets.icons.emptyWidget.icEmptyWidget.svg(
      width: 0.80.sw,
    );
  }

  Widget get _buildTitle {
    return Text(
      title ?? LocaleKeys.ErrorMessages_EmptyWidgetInfo.tr(),
      textAlign: TextAlign.center,
      style: AppThemes.currentTheme.textTheme.bodyMedium?.copyWith(
        fontWeight: AppFontWeight.medium.value,
      ),
    );
  }

  Widget get _buildSubTitle {
    return Text(
      subTitle ?? '',
      textAlign: TextAlign.center,
      style: AppThemes.currentTheme.textTheme.bodySmall
          ?.copyWith(color: AppLightColors.secondaryTextColor),
    );
  }

  Widget get _buildFooterButton {
    if (onPress == null) return const SizedBox();
    return Padding(
      padding: EdgeInsets.only(
        top: 12.h,
      ),
      child: AppElevatedButton(
        buttonText: buttonText ?? '',
        onPressed: () {
          onPress!();
        },
      ),
    );
  }
}
