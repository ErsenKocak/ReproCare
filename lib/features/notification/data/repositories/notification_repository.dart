import 'package:reprocare/common/base/model/request/pagination_request_param/pagination_request_param.dart';
import 'package:reprocare/common/base/result/base_result.dart';
import 'package:reprocare/features/notification/data/models/notification_model/notification_model.dart';
import 'package:reprocare/features/notification/data/models/notification_token_model/notification_token_model.dart';
import 'package:reprocare/features/notification/data/services/i_notification_service.dart';
import 'package:reprocare/features/notification/domain/entities/request/notification_token_request_param/notification_token_request_param.dart';
import 'package:reprocare/features/notification/domain/entities/response/notification_model/notification_entity.dart';
import 'package:reprocare/features/notification/domain/entities/response/notification_token_entity/notification_token_entity.dart';
import 'package:reprocare/features/notification/domain/repositories/i_notification_repository.dart';

final class NotificationRepository implements INotificationRepository {
  final INotificationService _notificationService;

  NotificationRepository(this._notificationService);

  @override
  Future<Result<List<NotificationEntity>, AppException>>
      getNotifications() async {
    final response = await _notificationService.getNotifications();

    return switch (response) {
      Success(value: final List<NotificationModel> _notificationModelList) =>
        Success(_notificationModelList
            .map((e) => NotificationEntity.fromJson(e.toJson()))
            .toList()),
      Failure(exception: final AppException exception) => Failure(exception)
    };
  }

  @override
  Future<Result<bool, AppException>> deleteNotification(
    int id,
  ) async {
    return await _notificationService.deleteNotification(id);
  }

  @override
  Future<Result<bool, AppException>> readNotification(
    int id,
  ) async {
    return await _notificationService.readNotification(id);
  }

  @override
  Future<Result<NotificationTokenEntity, AppException>> insertNotificationToken(
    NotificationTokenRequestParam notificationTokenRequestParam,
  ) async {
    final response = await _notificationService
        .insertNotificationToken(notificationTokenRequestParam);

    return switch (response) {
      Success(value: final NotificationTokenModel _notificationTokenModel) =>
        Success(
            NotificationTokenEntity.fromJson(_notificationTokenModel.toJson())),
      Failure(exception: final AppException exception) => Failure(exception)
    };
  }
}
