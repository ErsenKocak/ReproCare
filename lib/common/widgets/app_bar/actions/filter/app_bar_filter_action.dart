import 'package:flutter/material.dart';
import 'package:reprocare/common/widgets/svg_picture/app_svg_picture.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';
import 'package:reprocare/generated/assets.gen.dart';

class AppBarFilterAction extends StatelessWidget {
  const AppBarFilterAction({super.key, required this.onTap});

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return AppSvgPicture(
      path: Assets.icons.general.iconFilter.path,
      color: AppThemes.currentTheme.appBarTheme.actionsIconTheme?.color,
      onTap: onTap,
    );
  }
}
