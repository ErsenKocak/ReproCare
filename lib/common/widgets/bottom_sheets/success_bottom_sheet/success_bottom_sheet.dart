import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reprocare/common/router/app_router.dart';
import 'package:reprocare/common/widgets/buttons/elevated_button/elevated_button.dart';
import 'package:reprocare/core/constants/colors/app_light_colors.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';
import 'package:reprocare/core/extensions/sized_box/sized_box_extension.dart';
import 'package:reprocare/generated/assets.gen.dart';
import 'package:reprocare/generated/locale_keys.g.dart';

class SuccessBottomSheetWidget extends StatelessWidget {
  const SuccessBottomSheetWidget({
    super.key,
    this.headerMessage,
    this.bodyMessage,
    this.onLaterPop,
    this.isViewPop = false,
    this.viewPopParameter,
  });
  final String? bodyMessage;
  final String? headerMessage;
  final Function()? onLaterPop;
  final bool? isViewPop;
  final dynamic viewPopParameter;

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
          headerMessage ?? LocaleKeys.Global_ProcessCompletedSuccesfully.tr(),
          textAlign: TextAlign.center,
          style: AppThemes.currentTheme.textTheme.bodyLarge,
        ),
        bodyMessage != null
            ? Column(
                children: [
                  24.h.sbxh,
                  Text(
                    bodyMessage ?? '',
                    textAlign: TextAlign.center,
                    style: AppThemes.currentTheme.textTheme.labelSmall
                        ?.copyWith(color: AppLightColors.secondaryTextColor),
                  ),
                ],
              )
            : const SizedBox(),
        32.h.sbxh,
        AppElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            if (isViewPop == true) {
              AppRouter.pop(value: viewPopParameter);
            }
            if (onLaterPop != null) {
              onLaterPop!();
            }
          },
          buttonText: "Kapat",
        ),
        8.h.sbxh,
      ],
    );
  }

  Widget get _buildInfoImage {
    return AppThemes.brightness == Brightness.light
        ? Assets.images.bottomSheet.imgBigSuccess.image(height: 80.h)
        : Assets.images.bottomSheet.imgBigSuccessDark.image(height: 80.h);
  }
}
