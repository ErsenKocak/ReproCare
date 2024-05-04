import 'package:flutter/material.dart';
import 'package:reprocare/common/router/app_router.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';
import 'package:reprocare/generated/assets.gen.dart';

class AppBarArrowBackLeading extends StatelessWidget {
  const AppBarArrowBackLeading({super.key, this.onTap});
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!();
        } else {
          AppRouter.pop();
        }
      },
      child: Assets.icons.appBar.iconAppBarArrowBack.svg(
        color: AppThemes.currentTheme.appBarTheme.actionsIconTheme?.color,
      ),
    );
  }
}
