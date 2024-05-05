import 'package:reprocare/common/base/model/request/pagination_request_param/pagination_request_param.dart';
import 'package:reprocare/common/base/result/base_result.dart';
import 'package:reprocare/features/notification/domain/entities/request/notification_token_request_param/notification_token_request_param.dart';
import 'package:reprocare/features/notification/domain/entities/response/notification_model/notification_entity.dart';
import 'package:reprocare/features/notification/domain/entities/response/notification_token_entity/notification_token_entity.dart';

abstract class INotificationRepository {
  Future<Result<List<NotificationEntity>, AppException>> getNotifications(
    PaginationRequestParam paginationRequest,
  );
  Future<Result<bool, AppException>> deleteNotification(String notificationId);
  Future<Result<bool, AppException>> readNotification(String notificationId);

  Future<Result<NotificationTokenEntity, AppException>> insertNotificationToken(
    NotificationTokenRequestParam notificationTokenRequestParam,
  );
}
