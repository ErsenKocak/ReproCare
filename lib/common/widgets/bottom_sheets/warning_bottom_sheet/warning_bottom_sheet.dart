import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reprocare/common/widgets/buttons/elevated_button/elevated_button.dart';
import 'package:reprocare/common/widgets/buttons/elevated_outline_button/elevated_outline_button.dart';
import 'package:reprocare/core/constants/colors/app_light_colors.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';
import 'package:reprocare/core/extensions/sized_box/sized_box_extension.dart';
import 'package:reprocare/generated/assets.gen.dart';
import 'package:reprocare/generated/locale_keys.g.dart';

class WarningBottomSheetWidget extends StatelessWidget {
  const WarningBottomSheetWidget({
    super.key,
    this.headerMessage,
    this.bodyMessage,
  });
  final String? bodyMessage;
  final String? headerMessage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          24.h.sbxh,
          _buildInfoImage,
          24.h.sbxh,
          Text(
            headerMessage ?? LocaleKeys.ErrorMessages_GlobalError.tr(),
            textAlign: TextAlign.center,
            style: AppThemes.currentTheme.textTheme.bodyLarge,
          ),
          24.h.sbxh,
          Text(
            bodyMessage ?? '',
            textAlign: TextAlign.center,
            style: AppThemes.currentTheme.textTheme.bodySmall
                ?.copyWith(color: AppLightColors.secondaryTextColor),
          ),
          32.h.sbxh,
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: AppElevatedOutlineButton(
                  onPressed: () => Navigator.pop(context),
                  buttonText: LocaleKeys.Global_Cancel.tr(),
                ),
              ),
              10.0.w.sbxw,
              Expanded(
                child: AppElevatedButton(
                  buttonText: LocaleKeys.Global_Continue.tr(),
                  onPressed: () {},
                ),
              ),
              8.h.sbxh,
            ],
          ),
        ],
      ),
    );
  }

  Widget get _buildInfoImage {
    return AppThemes.brightness == Brightness.light
        ? Assets.images.bottomSheet.imgBigWarning.image(height: 80.h)
        : Assets.images.bottomSheet.imgBigWarningDark.image(height: 80.h);
  }
}
