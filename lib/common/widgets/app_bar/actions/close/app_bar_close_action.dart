import 'package:flutter/material.dart';
import 'package:reprocare/common/router/app_router.dart';
import 'package:reprocare/common/widgets/svg_picture/app_svg_picture.dart';
import 'package:reprocare/core/constants/colors/app_dark_colors.dart';
import 'package:reprocare/core/constants/colors/app_light_colors.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';
import 'package:reprocare/generated/assets.gen.dart';

class AppBarCloseAction extends StatelessWidget {
  const AppBarCloseAction({super.key, this.onTap, this.color, this.height});
  final Function()? onTap;
  final Color? color;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return AppSvgPicture(
      onTap: () {
        if (onTap != null) {
          onTap!();
        } else {
          AppRouter.pop();
        }
      },
      path: Assets.icons.general.iconClose.path,
      color: color ??
          AppThemes.getColorByBrightness(
            lightColor: AppDarkColors.black,
            darkColor: AppLightColors.white,
          ),
      height: height,
    );
  }
}
