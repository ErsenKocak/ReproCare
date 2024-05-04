import 'package:flutter/material.dart';
import 'package:reprocare/common/router/app_router.dart';
import 'package:reprocare/common/router/app_routes.dart';
import 'package:reprocare/common/widgets/svg_picture/app_svg_picture.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';
import 'package:reprocare/generated/assets.gen.dart';

class AppBarSettingsAction extends StatelessWidget {
  const AppBarSettingsAction({super.key});

  @override
  Widget build(BuildContext context) {
    return AppSvgPicture(
      onTap: () => AppRouter.goNamed(AppRoutes.Settings.path),
      path: Assets.icons.appBar.iconAppBarSettings.path,
      color: AppThemes.currentTheme.appBarTheme.actionsIconTheme?.color,
    );
  }
}
