import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reprocare/common/cubit/theme/data/enums/theme_mode_enum.dart';
import 'package:reprocare/common/functions/app/app_functions.dart';
import 'package:reprocare/common/router/app_router.dart';
import 'package:reprocare/common/router/app_routes.dart';
import 'package:reprocare/common/widgets/app_bar/app_bar_widget.dart';
import 'package:reprocare/common/widgets/app_bar/leading/profile_avatar/app_bar_profile_avatar_leading.dart';
import 'package:reprocare/common/widgets/bottom_sheets/bottom_sheet/app_bottom_sheet.dart';
import 'package:reprocare/core/constants/colors/app_dark_colors.dart';
import 'package:reprocare/core/constants/colors/app_light_colors.dart';
import 'package:reprocare/core/constants/font_weight/app_font_weight.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';
import 'package:reprocare/core/extensions/sized_box/sized_box_extension.dart';
import 'package:reprocare/features/settings/presentation/widgets/settings_language_item/settings_language_item.dart';
import 'package:reprocare/features/settings/presentation/widgets/settings_list_item/data/entities/list_tile_item.dart';
import 'package:reprocare/features/settings/presentation/widgets/settings_theme_item.dart/settings_theme_item.dart';
import 'package:reprocare/generated/assets.gen.dart';
import 'package:reprocare/generated/locale_keys.g.dart';
import 'package:reprocare/helper/localization/localization_helper.dart';

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
      leading: AppBarCircleAvatarLeading(),
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
