import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reprocare/common/widgets/buttons/elevated_button/elevated_button.dart';
import 'package:reprocare/common/widgets/buttons/elevated_outline_button/elevated_outline_button.dart';
import 'package:reprocare/core/constants/colors/app_light_colors.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';
import 'package:reprocare/core/extensions/sized_box/sized_box_extension.dart';
import 'package:reprocare/generated/assets.gen.dart';
import 'package:reprocare/generated/locale_keys.g.dart';

class QuestionBottomSheetWidget extends StatelessWidget {
  const QuestionBottomSheetWidget({
    super.key,
    required this.headerMessage,
    this.bodyMessage,
    this.cancelButtonText,
    this.confirmButtonText,
    required this.onConfirmFunction,
  });
  final String? bodyMessage;
  final String headerMessage;
  final String? cancelButtonText;
  final String? confirmButtonText;
  final Function() onConfirmFunction;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildInfoImage,
        24.h.sbxh,
        Text(
          headerMessage,
          textAlign: TextAlign.center,
          style: AppThemes.currentTheme.textTheme.bodyLarge,
        ),
        bodyMessage != null
            ? Column(
                children: [
                  24.h.sbxh,
                  Text(
                    bodyMessage ?? LocaleKeys.ErrorMessages_GlobalError.tr(),
                    textAlign: TextAlign.center,
                    style: AppThemes.currentTheme.textTheme.labelSmall
                        ?.copyWith(color: AppLightColors.secondaryTextColor),
                  ),
                ],
              )
            : const SizedBox(),
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
                onPressed: () async {
                  Navigator.pop(context);
                  await onConfirmFunction();
                },
              ),
            ),
          ],
        ),
        8.h.sbxh,
      ],
    );
  }

  Widget get _buildInfoImage {
    return AppThemes.brightness == Brightness.light
        ? Assets.images.bottomSheet.imgBigWarning.image(height: 80.h)
        : Assets.images.bottomSheet.imgBigWarningDark.image(height: 80.h);
  }
}
