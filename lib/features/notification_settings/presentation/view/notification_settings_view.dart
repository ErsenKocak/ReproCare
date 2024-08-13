import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reprocare/common/widgets/app_bar/app_bar_widget.dart';
import 'package:reprocare/common/widgets/app_bar/leading/arrow_back/app_bar_arrow_back_leading.dart';
import 'package:reprocare/common/widgets/bottom_sheets/bottom_sheet/app_bottom_sheet.dart';
import 'package:reprocare/common/widgets/bottom_sheets/select_bottom_sheet/select_bottom_sheet.dart';
import 'package:reprocare/common/widgets/svg_picture/app_svg_picture.dart';
import 'package:reprocare/core/constants/colors/app_dark_colors.dart';
import 'package:reprocare/core/constants/colors/app_light_colors.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';
import 'package:reprocare/core/extensions/sized_box/sized_box_extension.dart';
import 'package:reprocare/features/notification_settings/domain/entities/notification_sound_item/notification_sound_item.dart';

import 'package:reprocare/features/settings/domain/enums/permission_type.dart';
import 'package:reprocare/features/settings/presentation/cubit/user_settings_cubit.dart';
import 'package:reprocare/features/settings/presentation/widgets/settings_list_item/data/entities/list_tile_item.dart';
import 'package:reprocare/features/settings/presentation/widgets/settings_list_item/list_tile_item_widget.dart';
import 'package:reprocare/features/settings/presentation/widgets/settings_permission_item/settings_permission_item.dart';
import 'package:reprocare/generated/assets.gen.dart';
import 'package:reprocare/generated/locale_keys.g.dart';

import 'package:reprocare/features/notification_settings/presentation/mixin/notification_settings_mixin.dart';

class NotificationSettingsView extends StatefulWidget {
  const NotificationSettingsView({super.key});

  @override
  State<NotificationSettingsView> createState() =>
      _NotificationSettingsViewState();
}

class _NotificationSettingsViewState extends State<NotificationSettingsView>
    with NotificationSettingsMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  get _buildAppBar {
    return AppBarWidget(
      leading: AppBarArrowBackLeading(),
      titleText: LocaleKeys.Notification_NotificationSettings.tr(),
    );
  }

  Widget get _buildBody {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        8.h.sbxh,
        _buildSettingsItems,
      ],
    );
  }

  Widget get _buildSettingsItems {
    List<ListTileItem> viewItems = [
      ListTileItem(
        leadingWidget: _buildListTileItemLeading(AppSvgPicture(
          path: Assets.icons.general.iconAppBarNotification.path,
          color: AppLightColors.white,
        )),
        title: LocaleKeys.Settings_PermissionSettings.tr(),
        onTap: () {
          AppBottomSheet.show(
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.h, horizontal: 24.w),
            child: (bottomSheetContext) =>
                BlocBuilder<UserSettingsCubit, UserSettingsState>(
              builder: (context, state) {
                return Column(
                  children: [
                    SettingsPermissionItem(
                      permissionType: PermissionType.Notification,
                      isActive: userSettingsCubit
                              .userSettings?.isNotificationActive ??
                          false,
                      onChange: () {
                        changeUserPermissionSettings(
                            userSettingsCubit.userSettings!.copyWith(
                                isNotificationActive: !userSettingsCubit
                                    .userSettings!.isNotificationActive!));
                      },
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
      ListTileItem(
        leadingWidget: _buildListTileItemLeading(AppSvgPicture(
          path: Assets.icons.settings.sound.path,
          color: AppLightColors.white,
        )),
        title: LocaleKeys.Notification_NotificationSound.tr(),
        onTap: () async {
          await AppSelectBottomSheet.show<NotificationSoundItem>(
            items: userSettingsCubit.notificationSounds,
            selectedItem: userSettingsCubit.activeNotificationSound,
            renderItemName: (item) => item.name,
            onChange: (item) async {
              await onTapNotificationSound(item);
            },
          );

          if (audioPlayerHandler.playerIsPlaying()) {
            await audioPlayerHandler.playerStop();
          }
        },
      )
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

  Widget _buildListTileItemLeading(Widget leading) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppThemes.getColorByBrightness(
            lightColor: AppLightColors.primaryColor,
            darkColor: AppDarkColors.primaryColor),
        borderRadius: BorderRadius.circular(4),
      ),
      child: leading,
    );
  }
}
