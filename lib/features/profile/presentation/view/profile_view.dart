import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:reprocare/common/widgets/app_bar/custom_app_bar.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';
import 'package:reprocare/core/enums/app_screen_type/app_screen_type.dart';
import 'package:reprocare/generated/locale_keys.g.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  get _buildAppBar {
    AppScreenType screenType = AppScreenType.lg.getTypeFromWidth();
    if (screenType != AppScreenType.xs) return const SizedBox();

    return CustomAppBar(
      leading: const SizedBox(),
      title: LocaleKeys.BottomNavigationBar_Profile.tr(),
    );
  }

  Widget get _buildBody {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_buildTitle],
    );
  }

  Widget get _buildTitle {
    return Text(
      'Hoş geldin,\nErsen Koçak',
      style: AppThemes.currentTheme.textTheme.titleLarge?.copyWith(),
    );
  }
}
