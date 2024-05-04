import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reprocare/common/cubit/theme/data/enums/theme_mode_enum.dart';
import 'package:reprocare/common/functions/app/app_functions.dart';
import 'package:reprocare/common/router/app_route_observer_mixin.dart';
import 'package:reprocare/common/router/app_router.dart';
import 'package:reprocare/common/router/app_routes.dart';
import 'package:reprocare/common/widgets/app_bar/app_bar_widget.dart';
import 'package:reprocare/common/widgets/app_bar/leading/arrow_back/app_bar_arrow_back_leading.dart';
import 'package:reprocare/common/widgets/app_bar/leading/profile_avatar/app_bar_profile_avatar_leading.dart';
import 'package:reprocare/common/widgets/bottom_sheets/bottom_sheet/app_bottom_sheet.dart';
import 'package:reprocare/common/widgets/buttons/elevated_button/elevated_button.dart';
import 'package:reprocare/common/widgets/scrollable_widgets/scrollable_body/scrollable_body.dart';
import 'package:reprocare/core/constants/colors/app_dark_colors.dart';
import 'package:reprocare/core/constants/colors/app_light_colors.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';
import 'package:reprocare/core/extensions/sized_box/sized_box_extension.dart';
import 'package:reprocare/features/settings/presentation/cubit/user_settings_cubit.dart';
import 'package:reprocare/features/settings/presentation/mixin/settings_view_mixin.dart';
import 'package:reprocare/features/settings/presentation/widgets/settings_language_item/settings_language_item.dart';
import 'package:reprocare/features/settings/presentation/widgets/settings_list_item/data/entities/list_tile_item.dart';
import 'package:reprocare/features/settings/presentation/widgets/settings_list_item/list_tile_item_widget.dart';
import 'package:reprocare/features/settings/presentation/widgets/settings_theme_item.dart/settings_theme_item.dart';
import 'package:reprocare/generated/assets.gen.dart';
import 'package:reprocare/generated/locale_keys.g.dart';
import 'package:reprocare/helper/localization/localization_helper.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView>
    with SettingsViewMixin, RouterObserverMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  get _buildAppBar {
    return AppBarWidget(
      titleText: LocaleKeys.Settings_Settings.tr(),
    );
  }

  Widget get _buildBody {
    return ScrollableBody(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildUserInformation,
          12.0.h.sbxh,
          _buildSettingsItems,
        ],
      ),
    );
  }

  Widget get _buildUserInformation {
    return BlocBuilder<UserSettingsCubit, UserSettingsState>(
      builder: (context, state) => state.when(
        initial: () => const SizedBox(),
        loading: () => const SizedBox(),
        error: (final String errorMessage) => const SizedBox(),
        success: () => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            12.0.h.sbxh,
            AppBarCircleAvatarLeading(),
            12.0.h.sbxh,
            Text(
              '${userSettingsCubit.userSettings?.user?.name} ${userSettingsCubit.userSettings?.user?.surname}',
              style: AppThemes.currentTheme.textTheme.bodyMedium,
            ),
            12.0.h.sbxh,
            _buildEditProfile,
          ],
        ),
      ),
    );
  }

  Widget get _buildEditProfile {
    return Container(
      height: 24.h,
      child: AppElevatedButton(
        buttonText: LocaleKeys.Settings_EditProfile.tr(),
        isLong: false,
        buttonColor: AppThemes.brightness == Brightness.light
            ? AppLightColors.primaryColor
            : AppDarkColors.secondaryDarkColor,
        textColor: AppThemes.brightness == Brightness.light
            ? null
            : AppDarkColors.primaryPink,
        // onPressed: () =>
        //     AppRouter.navigatePushNamed(AppRoutes.ProfileSettings.path),
      ),
    );
  }

  Widget get _buildSettingsItems {
    List<ListTileItem> viewItems = [
      ListTileItem(
        leadingWidget: _listTileItemLeading(Icon(
          Icons.language,
          color: AppLightColors.white,
        )),
        title: LocaleKeys.Settings_Language.tr(),
        onTap: () {
          AppBottomSheet.show(
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.h, horizontal: 24.w),
            child: (bottomSheetContext) => Column(
              children: [
                SettingsLanguageItem(locale: AppLocalizationHelper.tr),
                8.h.sbxh,
                SettingsLanguageItem(locale: AppLocalizationHelper.en),
              ],
            ),
          );
        },
      ),
      ListTileItem(
        leadingWidget: _listTileItemLeading(
          Assets.icons.settings.iconTheme.svg(color: AppLightColors.white),
        ),
        title: LocaleKeys.Settings_Theme.tr(),
        onTap: () {
          AppBottomSheet.show(
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.h, horizontal: 24.w),
            child: (bottomSheetContext) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SettingsThemeItem(themeMode: ThemeModeEnum.Light),
                8.h.sbxh,
                SettingsThemeItem(themeMode: ThemeModeEnum.Dark),
                8.h.sbxh,
                SettingsThemeItem(themeMode: ThemeModeEnum.System),
              ],
            ),
          );
        },
      ),
      ListTileItem(
        leadingWidget: _listTileItemLeading(
          Assets.icons.settings.iconWebSite.svg(color: AppLightColors.white),
        ),
        title: LocaleKeys.Settings_WebSite.tr(),
        onTap: () => AppFunctions.openStringUrl(
          url: 'https://reprocare.com.tr/',
        ),
      ),
      ListTileItem(
        leadingWidget: _listTileItemLeading(
          Assets.icons.settings.iconLogout.svg(color: AppLightColors.white),
        ),
        title: LocaleKeys.Settings_Logout.tr(),
        onTap: () async {
          await logout();
        },
      ),
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: viewItems.length,
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        bottom: 24.h,
      ),
      itemBuilder: (context, index) =>
          ListTileItemWidget(item: viewItems[index]),
    );
  }

  Widget _listTileItemLeading(Widget leading) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppThemes.brightness == Brightness.light
            ? AppLightColors.primaryColor
            : AppDarkColors.primaryColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: leading,
    );
  }

  @override
  void didPop() {
    log('SettingsView didPop');
  }

  @override
  void didPopNext() {
    log('SettingsView didPopNext');
  }

  @override
  void didPush() {
    log('SettingsView didPush');
  }

  @override
  void didPushNext() {
    log('SettingsView didPushNext');
  }
}
