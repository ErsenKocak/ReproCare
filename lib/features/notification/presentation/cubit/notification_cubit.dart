import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reprocare/common/base/cubit/base_cubit.dart';
import 'package:reprocare/common/base/cubit/base_state.dart';
import 'package:reprocare/common/base/model/request/pagination_request_param/pagination_request_param.dart';
import 'package:reprocare/common/base/result/base_result.dart';
import 'package:reprocare/core/extensions/list/list_extension.dart';
import 'package:reprocare/features/notification/domain/entities/request/notification_token_request_param/notification_token_request_param.dart';
import 'package:reprocare/features/notification/domain/entities/response/notification_model/notification_entity.dart';
import 'package:reprocare/features/notification/domain/entities/response/notification_token_entity/notification_token_entity.dart';
import 'package:reprocare/features/notification/domain/repositories/i_notification_repository.dart';
import 'package:collection/collection.dart';
part 'notification_state.dart';
part 'notification_cubit.freezed.dart';

class NotificationCubit extends Cubit<NotificationState>
    with BaseCubit<NotificationState> {
  NotificationCubit(this._notificationRepository)
      : super(NotificationState.initial());

  final INotificationRepository _notificationRepository;
  List<NotificationTokenEntity>? userNotificationTokenList;
  List<NotificationEntity>? notificationList;
  List<NotificationEntity>? notificationDummyList;

  @override
  Future<void> initialize() async {}

  Future<void> getNotifications() async {
    safeEmit(NotificationState.loading());

    final response = await _notificationRepository.getNotifications();

    final value = switch (response) {
      Success(
        value: final List<NotificationEntity> _notificationTokenListEntity
      ) =>
        {
          notificationList = _notificationTokenListEntity,
          checkForUnReadNotifications,
          safeEmit(NotificationState.listSuccess()),
        },
      Failure(exception: final AppException exception) => {
          safeEmit(NotificationState.failure(exception.message)),
        }
    };
  }

  Future<void> readNotification(NotificationEntity notification) async {
    // safeEmit(NotificationState.loading());

    final response =
        await _notificationRepository.readNotification(notification.id!);

    final value = switch (response) {
      Success(value: final bool _response) => {
          notification = notification.copyWith(isRead: true),
          _updateNotificationInList(notification),
          safeEmit(NotificationState.listSuccess()),
        },
      Failure(exception: final AppException exception) => {
          safeEmit(NotificationState.failure(exception.message)),
        }
    };
  }

  Future<void> deleteNotification(NotificationEntity notification) async {
    safeEmit(NotificationState.loading());

    final response =
        await _notificationRepository.deleteNotification(notification.id!);

    final value = switch (response) {
      Success(value: final bool _response) => {
          safeEmit(NotificationState.listSuccess()),
        },
      Failure(exception: final AppException exception) => {
          safeEmit(NotificationState.failure(exception.message)),
        }
    };
  }

  Future<void> insertNotificationToken(
    NotificationTokenRequestParam notificationTokenRequestParam,
  ) async {
    safeEmit(NotificationState.loading());

    final response = await _notificationRepository
        .insertNotificationToken(notificationTokenRequestParam);

    final value = switch (response) {
      Success(value: final NotificationTokenEntity _notificationTokenEntity) =>
        {
          safeEmit(NotificationState.listSuccess()),
        },
      Failure(exception: final AppException exception) => {
          safeEmit(NotificationState.failure(exception.message)),
        }
    };
  }

  void _updateNotificationInList(
    NotificationEntity newNotification,
  ) {
    int previousTaskIndex = notificationList!
        .indexWhere((notification) => notification.id == newNotification.id);

    notificationList?.update(previousTaskIndex, newNotification);
  }

  bool get checkForUnReadNotifications => notificationList?.firstWhereOrNull(
              (notification) => notification.isRead == false) !=
          null
      ? true
      : false;
}
