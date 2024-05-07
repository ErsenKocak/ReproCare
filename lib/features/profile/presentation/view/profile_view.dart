import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:reprocare/common/widgets/app_bar/app_bar_widget.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';
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
      appBar: _buildAppbar,
      body: _buildBody,
    );
  }

  get _buildAppbar {
    return AppBarWidget(
      titleText: LocaleKeys.BottomNavigationBar_Profile.tr(),
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
