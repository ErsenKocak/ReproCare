import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reprocare/features/notification_settings/presentation/view/notification_settings_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reprocare/common/cubit/language/language_cubit.dart';
import 'package:reprocare/common/cubit/theme/data/enums/theme_mode_enum.dart';
import 'package:reprocare/common/cubit/theme/theme_cubit.dart';
import 'package:reprocare/common/cubit/theme/theme_state_model.dart';
import 'package:reprocare/common/functions/app/app_functions.dart';
import 'package:reprocare/common/router/app_route_observer_mixin.dart';
import 'package:reprocare/common/router/app_router.dart';
import 'package:reprocare/common/router/app_routes.dart';
import 'package:reprocare/common/widgets/app_bar/app_bar_widget.dart';

import 'package:reprocare/common/widgets/bottom_sheets/bottom_sheet/app_bottom_sheet.dart';
import 'package:reprocare/common/widgets/buttons/elevated_button/elevated_button.dart';
import 'package:reprocare/common/widgets/scrollable_widgets/scrollable_body/scrollable_body.dart';
import 'package:reprocare/common/widgets/svg_picture/app_svg_picture.dart';
import 'package:reprocare/common/widgets/responsive/platform_page_container.dart';
import 'package:reprocare/core/constants/application/application.dart';
import 'package:reprocare/core/constants/colors/app_dark_colors.dart';
import 'package:reprocare/core/constants/colors/app_light_colors.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';
import 'package:reprocare/core/extensions/sized_box/sized_box_extension.dart';
import 'package:reprocare/features/settings/presentation/cubit/user_settings_cubit.dart';
import 'package:reprocare/features/settings/presentation/mixin/settings_view_mixin.dart';
import 'package:reprocare/features/settings/presentation/widgets/settings_list_item/data/entities/list_tile_item.dart';
import 'package:reprocare/features/settings/presentation/widgets/settings_list_item/list_tile_item_widget.dart';
import 'package:reprocare/features/settings/presentation/widgets/settings_theme_item.dart/settings_theme_item.dart';
import 'package:reprocare/generated/assets.gen.dart';
import 'package:reprocare/generated/locale_keys.g.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView>
    with SettingsViewMixin, RouterObserverMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeStateModel>(
      builder: (context, state) {
        return BlocBuilder<LanguageCubit, Locale>(
          builder: (context, state) {
            return Scaffold(
              appBar: _buildAppBar,
              body: _buildBody,
            );
          },
        );
      },
    );
  }

  get _buildAppBar {
    return AppBarWidget(
      titleText: LocaleKeys.Settings_Settings.tr(),
    );
  }

  Widget get _buildBody {
    return BlocBuilder<UserSettingsCubit, UserSettingsState>(
      builder: (context, state) {
        return PlatformPageContainer(
          child: ScrollableBody(
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                8.h.sbxh,
                _buildSettingsItems,
              ],
            ),
            withoutExpandedWidget: Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: Text(
                '${Application.versionName}(${Application.versionCode})',
                style: AppThemes.currentTheme.textTheme.labelSmall,
              ),
            ),
          ),
        );
      },
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
            : AppDarkColors.primaryRed,
        // onPressed: () =>
        //     AppRouter.navigatePushNamed(AppRoutes.ProfileSettings.path),
      ),
    );
  }

  Widget get _buildSettingsItems {
    List<ListTileItem> viewItems = [
      ListTileItem(
        leadingWidget: _listTileItemLeading(AppSvgPicture(
          path: Assets.icons.general.iconAppBarNotification.path,
          color: AppLightColors.white,
        )),
        title: LocaleKeys.Notification_Notifications.tr(),
        onTap: () {
          if (kIsWeb) {
            showDialog(
              context: context,
              builder: (context) => const WebNotificationSettingsDialog(),
            );
          } else {
            AppRouter.navigatePushNamed(AppRoutes.NotificationSettings.path);
          }
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
          url: 'https://reprocare.com.tr',
        ),
      ),
      ListTileItem(
        leadingWidget: _listTileItemLeading(
          Assets.icons.settings.iconLogout.svg(color: AppLightColors.white),
        ),
        title: LocaleKeys.Settings_Logout.tr(),
        onTap: () async => await logout(),
      ),
    ];

    if (kIsWeb) {
      return _buildWebSettingsGrid(viewItems);
    }

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

  Widget _buildWebSettingsGrid(List<ListTileItem> items) {
    return LayoutBuilder(builder: (context, constraints) {
      return Wrap(
        spacing: 24,
        runSpacing: 24,
        children: items.map((item) => _buildWebSettingCard(item)).toList(),
      );
    });
  }

  Widget _buildWebSettingCard(ListTileItem item) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: item.onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: 300,
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppThemes.currentTheme.cardColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 20,
                offset: Offset(0, 4),
              ),
            ],
            border: Border.all(
              color: AppThemes.currentTheme.dividerColor.withOpacity(0.5),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppLightColors.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: item.leadingWidget,
              ),
              SizedBox(height: 16),
              Text(
                item.title,
                style: AppThemes.currentTheme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'View details', // Placeholder or remove
                style: AppThemes.currentTheme.textTheme.bodySmall?.copyWith(
                  color: AppLightColors.secondaryTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _listTileItemLeading(Widget leading) {
    // For Web Grid, verify if we need to modify this.
    // leadingWidget is reused.
    // But inside the grid card, I am wrapping leadingWidget again.
    // The original leadingWidget has a Container background.
    // I can strip it or just use it.
    // Actually, ListTileItemWidget expects leadingWidget wrapped.
    // But for my grid, I might want the raw icon.
    // ListTileItem defines leadingWidget as Widget.
    // _listTileItemLeading wraps the icon.
    // In Grid, I'll just use it as is, it's fine.

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
