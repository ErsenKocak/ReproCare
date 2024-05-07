import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reprocare/common/base/cubit/base_cubit.dart';
import 'package:reprocare/common/base/cubit/base_state.dart';
import 'package:reprocare/common/base/model/request/pagination_request_param/pagination_request_param.dart';
import 'package:reprocare/common/base/result/base_result.dart';
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

  Future<Result<List<NotificationEntity>, AppException>> getNotifications(
      PaginationRequestParam paginationRequest) async {
    safeEmit(NotificationState.loading());

    for (var i = 0; i < 50; i++) {
      notificationDummyList ??= [];
      notificationDummyList?.add(NotificationEntity(
          id: '$i',
          isRead: i.isEven ? true : false,
          messageTitle: 'What is Lorem Ipsum? $i',
          messageBody:
              'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham. $i',
          createdDate: DateTime.now().toString()));
    }

    // final response =
    //     await _notificationRepository.getNotifications(paginationRequest);

    // final value = switch (response) {
    //   Success(
    //     value: final List<NotificationEntity> _notificationTokenListEntity
    //   ) =>
    //     {
    //       notificationList = _notificationTokenListEntity,
    //       checkForUnReadNotifications,
    //       safeEmit(NotificationState.listSuccess()),
    //     },
    //   Failure(exception: final AppException exception) => {
    //       safeEmit(NotificationState.failure(exception.message)),
    //     }
    // };
    safeEmit(NotificationState.listSuccess());

    return Success(notificationDummyList ?? []);
  }

  Future<void> readNotification(NotificationEntity notification) async {
    safeEmit(NotificationState.loading());

    final response =
        await _notificationRepository.readNotification(notification.id!);

    final value = switch (response) {
      Success(value: final bool _response) => {
          safeEmit(NotificationState.readSuccess()),
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
          safeEmit(NotificationState.deleteSuccess()),
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
          safeEmit(NotificationState.insertSuccess()),
        },
      Failure(exception: final AppException exception) => {
          safeEmit(NotificationState.failure(exception.message)),
        }
    };
  }

  bool get checkForUnReadNotifications => notificationList?.firstWhereOrNull(
              (notification) => notification.isRead == false) !=
          null
      ? true
      : false;
}
