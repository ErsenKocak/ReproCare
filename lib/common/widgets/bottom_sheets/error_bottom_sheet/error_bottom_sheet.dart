import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reprocare/common/widgets/buttons/elevated_button/elevated_button.dart';
import 'package:reprocare/core/constants/colors/app_light_colors.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';
import 'package:reprocare/core/extensions/sized_box/sized_box_extension.dart';
import 'package:reprocare/generated/assets.gen.dart';
import 'package:reprocare/generated/locale_keys.g.dart';

class ErrorBottomSheet extends StatelessWidget {
  const ErrorBottomSheet({
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
          _buildInfoImage,
          24.h.sbxh,
          Text(
            headerMessage ?? LocaleKeys.ErrorMessages_GlobalError.tr(),
            textAlign: TextAlign.center,
            style: AppThemes.currentTheme.textTheme.bodyLarge,
          ),
          bodyMessage != null && bodyMessage!.isNotEmpty
              ? Column(
                  children: [
                    24.h.sbxh,
                    Text(
                      bodyMessage!,
                      textAlign: TextAlign.center,
                      style: AppThemes.currentTheme.textTheme.bodySmall
                          ?.copyWith(color: AppLightColors.secondaryTextColor),
                    ),
                  ],
                )
              : const SizedBox(),
          32.h.sbxh,
          AppElevatedButton(
            onPressed: () => Navigator.pop(context),
            buttonText: LocaleKeys.Global_Close.tr(),
          ),
        ],
      ),
    );
  }

  Widget get _buildInfoImage {
    return AppThemes.brightness == Brightness.light
        ? Assets.images.bottomSheet.imgBigError.image(height: 80.h)
        : Assets.images.bottomSheet.imgBigErrorDark.image(height: 80.h);
  }
}
