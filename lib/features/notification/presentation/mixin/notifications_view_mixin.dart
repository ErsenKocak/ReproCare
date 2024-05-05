import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:reprocare/common/base/model/request/pagination_request_param/pagination_request_param.dart';
import 'package:reprocare/common/base/result/base_result.dart';
import 'package:reprocare/common/init/service_locator/service_locator_provider.dart';
import 'package:reprocare/common/widgets/bottom_sheets/bottom_sheet/app_bottom_sheet.dart';
import 'package:reprocare/common/widgets/bottom_sheets/question_bottom_sheet/question_bottom_sheet.dart';
import 'package:reprocare/features/notification/domain/entities/response/notification_model/notification_entity.dart';
import 'package:reprocare/features/notification/presentation/cubit/notification_cubit.dart';
import 'package:reprocare/features/notification/presentation/view/notifications_view.dart';
import 'package:reprocare/generated/locale_keys.g.dart';
import 'package:reprocare/core/extensions/list/list_extension.dart';

mixin NotificationViewMixin on State<NotificationsView> {
  late NotificationCubit notificationCubit;
  PaginationRequestParam notificationPaginationRequest =
      PaginationRequestParam(page: 0, size: 20);
  late PagingController<int, NotificationEntity>
      notificationPaginationController;
  late ValueNotifier<List<NotificationEntity>> notificationExpandNotifier;

  @override
  void initState() {
    super.initState();

    initializeMixin();
  }

  @override
  void dispose() {
    notificationPaginationController.dispose();
    super.dispose();
  }

  Future<void> initializeMixin() async {
    notificationPaginationController =
        PagingController<int, NotificationEntity>(
            firstPageKey: 0, invisibleItemsThreshold: 1);
    notificationCubit = ServiceLocatorProvider.provide<NotificationCubit>();
    notificationExpandNotifier = ValueNotifier<List<NotificationEntity>>([]);

    await initializeServices();
  }

  Future<void> initializeServices() async {}

  Future<Result<List<NotificationEntity>, AppException>> getNotifications(
      PaginationRequestParam paginationRequest) async {
    return await notificationCubit.getNotifications(paginationRequest);
  }

  Future<void> onTapSlidableDeleteButton(
      NotificationEntity notification) async {
    await AppBottomSheet.show(
      child: (bottomSheetContext) => QuestionBottomSheetWidget(
        headerMessage:
            LocaleKeys.Notification_AreYouSureDeleteNotification.tr(),
        confirmButtonText: LocaleKeys.Global_Delete.tr(),
        onConfirmFunction: () async {
          await _deleteNotification(notification);
        },
      ),
    );
  }

  Future<void> readNotification(NotificationEntity notification) async {
    _updateNotificationInList(notification.copyWith(isRead: true));
    await notificationCubit.readNotification(notification);
  }

  Future<void> _deleteNotification(NotificationEntity notification) async {
    notificationPaginationController.itemList?.remove(notification);

    await notificationCubit.deleteNotification(notification);
  }

  void onTapExpandNotification(NotificationEntity notification) {
    if (checkNotificationIsExpanded(notification)) {
      notificationExpandNotifier.value.remove(notification);
    } else {
      notificationExpandNotifier.value.add(notification);
    }
    notificationPaginationController.notifyListeners();
  }

  bool checkNotificationIsExpanded(NotificationEntity notification) =>
      notificationExpandNotifier.value.contains(notification);

  void _updateNotificationInList(
    NotificationEntity newNotification,
  ) {
    int previousTaskIndex = notificationPaginationController.itemList!
        .indexWhere((notification) => notification.id == newNotification.id);

    notificationPaginationController.itemList
        ?.update(previousTaskIndex, newNotification);
  }
}
