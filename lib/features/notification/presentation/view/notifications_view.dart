import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_time_ago/get_time_ago.dart';
import 'package:reprocare/common/functions/app/app_functions.dart';
import 'package:reprocare/common/functions/date/date_functions.dart';
import 'package:reprocare/common/widgets/app_bar/app_bar_widget.dart';
import 'package:reprocare/common/widgets/app_loading/app_loading.dart';
import 'package:reprocare/common/widgets/empty/empty_widget.dart';
import 'package:reprocare/common/widgets/pagination/app_pagination.dart';
import 'package:reprocare/common/widgets/slidable/slidable_widget.dart';
import 'package:reprocare/common/widgets/slidable/widgets/slidable_item/slidable_item_widget.dart';
import 'package:reprocare/common/widgets/svg_picture/app_svg_picture.dart';
import 'package:reprocare/core/constants/colors/app_light_colors.dart';
import 'package:reprocare/core/constants/font_weight/app_font_weight.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';
import 'package:reprocare/core/enums/date/date_format_types.dart';
import 'package:reprocare/core/extensions/sized_box/sized_box_extension.dart';
import 'package:reprocare/features/notification/domain/entities/response/notification_model/notification_entity.dart';
import 'package:reprocare/features/notification/presentation/mixin/notifications_view_mixin.dart';
import 'package:reprocare/features/notification/presentation/widgets/shimmer/notification_view_shimmer.dart';
import 'package:reprocare/generated/assets.gen.dart';
import 'package:reprocare/generated/locale_keys.g.dart';
import 'package:reprocare/helper/localization/localization_helper.dart';
import 'package:reprocare/helper/notification/local_notification/local_notification_helper.dart';
import 'dart:ui' as ui;

class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key});

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView>
    with NotificationViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar,
      body: _buildBody,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.notification_add),
          onPressed: () async {
            AppLoading.showLoading();
          }),
    );
  }

  get _buildAppbar {
    return AppBarWidget(
      titleText: LocaleKeys.Notification_Notifications.tr(),
    );
  }

  Widget get _buildBody {
    return AppPagination<NotificationEntity>(
      pagingController: notificationPaginationController,
      getItemsFunction: getNotifications,
      paginationRequest: notificationPaginationRequest,
      loadingWidget: NotificationViewShimmer(),
      emptyWidget: Padding(
          padding: EdgeInsets.only(top: 0.20.sh),
          child: AppEmptyWidget(
              title: LocaleKeys.Notification_NotificationEmptyInfo.tr())),
      itemBuilder: (context, item, index) => _buildNotificationCard(item),
    );
  }

  Widget _buildNotificationCard(NotificationEntity notification) {
    return SlidableWidget(
      slidableKey: notification.id ?? AppFunctions.randomGuid(),
      actionPaneWidgets: [
        _buildReadNotificationPane(notification),
        _buildDeleteNotificationPane(notification),
      ],
      child: Column(
        children: [
          8.h.sbxh,
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              16.w.sbxw,
              _buildNotificationUnReadContainer(notification),
              16.w.sbxw,
              Expanded(
                child: _buildNotificationBody(notification),
              ),
              16.w.sbxw,
            ],
          ),
          8.h.sbxh,
          _buildNotificationDivider,
        ],
      ),
    );
  }

  SlidableItemWidget _buildReadNotificationPane(
      NotificationEntity notification) {
    return SlidableItemWidget(
      borderRadius: BorderRadius.zero,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppSvgPicture(
            path: Assets.icons.general.iconReadNotification.path,
            height: 28.h,
            color: AppLightColors.white,
          ),
          4.h.sbxh,
          Text(
            LocaleKeys.Notification_Read.tr(),
            style: AppThemes.currentTheme.textTheme.labelSmall?.copyWith(
              fontWeight: AppFontWeight.medium.value,
              color: AppLightColors.white,
            ),
          ),
        ],
      ),
      onTap: () => readNotification(notification),
      boxColor: AppLightColors.auxiliaryGreen,
    );
  }

  SlidableItemWidget _buildDeleteNotificationPane(
      NotificationEntity notification) {
    return SlidableItemWidget(
      borderRadius: BorderRadius.zero,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppSvgPicture(
            path: Assets.icons.general.iconTrashFill.path,
            height: 28.h,
            color: AppLightColors.white,
          ),
          4.h.sbxh,
          Text(
            LocaleKeys.Global_Delete.tr(),
            style: AppThemes.currentTheme.textTheme.labelSmall?.copyWith(
              fontWeight: AppFontWeight.medium.value,
              color: AppLightColors.white,
            ),
          ),
        ],
      ),
      onTap: () => onTapSlidableDeleteButton(notification),
      boxColor: AppLightColors.auxiliaryRed,
    );
  }

  Widget _buildNotificationBody(NotificationEntity notification) {
    return ValueListenableBuilder(
      valueListenable: notificationExpandNotifier,
      builder: (context, value, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            int numberOfLines = getNumberOfLines(
                text: notification.messageBody ?? '', constraints: constraints);
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.messageTitle ?? '',
                  style: AppThemes.currentTheme.textTheme.bodySmall?.copyWith(
                    fontWeight: AppFontWeight.medium.value,
                  ),
                ),
                4.h.sbxh,
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notification.messageBody ?? '',
                      overflow: TextOverflow.ellipsis,
                      maxLines: checkNotificationIsExpanded(notification)
                          ? numberOfLines
                          : numberOfLines >= 2
                              ? 2
                              : 1,
                      style: AppThemes.currentTheme.textTheme.labelSmall
                          ?.copyWith(color: AppLightColors.secondaryTextColor),
                    ),
                    if (numberOfLines > 2) _expandableLabel(notification),
                  ],
                ),
                4.h.sbxh,
                Text(
                  GetTimeAgo.parse(
                    DateFunctions.stringToDateTime(
                        stringDate: notification.createdDate,
                        dateFormat: DateFormatTypes.ddMMyyyyHHmm),
                    pattern: DateFormatTypes.ddMMyyyyHHmm.format,
                    locale: AppLocalizationHelper.currentLocale.languageCode
                        .toLowerCase(),
                  ),
                  style: AppThemes.currentTheme.textTheme.labelSmall?.copyWith(
                      color: AppLightColors.secondaryTextColor, fontSize: 8.sp),
                )
              ],
            );
          },
        );
      },
    );
  }

  Widget _expandableLabel(
    NotificationEntity notification,
  ) {
    String labelText = checkNotificationIsExpanded(notification)
        ? LocaleKeys.Notification_Hide.tr()
        : LocaleKeys.Notification_Show.tr();

    return GestureDetector(
      onTap: () => onTapExpandNotification(notification),
      child:
          Text(labelText, style: AppThemes.currentTheme.textTheme.labelSmall),
    );
  }

  int getNumberOfLines(
      {required String text, required BoxConstraints constraints}) {
    final span = TextSpan(text: text);
    final tp = TextPainter(text: span, textDirection: ui.TextDirection.ltr);

    tp.layout(maxWidth: constraints.maxWidth);
    final numberOfLines = tp.computeLineMetrics().length;

    return numberOfLines;
  }

  Widget _buildNotificationUnReadContainer(NotificationEntity notification) {
    return Container(
      height: 6.w,
      width: 6.w,
      decoration: BoxDecoration(
          color: notification.isRead == false
              ? AppLightColors.primaryColor
              : Colors.transparent,
          borderRadius: BorderRadius.circular(100)),
    );
  }

  Widget get _buildNotificationDivider {
    return Divider(
      thickness: 0.1,
      height: 1,
    );
  }
}
