import 'package:reprocare/common/base/model/request/pagination_request_param/pagination_request_param.dart';
import 'package:reprocare/common/base/result/base_result.dart';
import 'package:reprocare/features/notification/data/models/notification_model/notification_model.dart';
import 'package:reprocare/features/notification/data/models/notification_token_model/notification_token_model.dart';
import 'package:reprocare/features/notification/domain/entities/request/notification_token_request_param/notification_token_request_param.dart';

abstract class INotificationService {
  Future<Result<List<NotificationModel>, AppException>> getNotifications(
      PaginationRequestParam paginationRequest);

  Future<Result<bool, AppException>> deleteNotification(int id);

  Future<Result<bool, AppException>> readNotification(int id);

  Future<Result<NotificationTokenModel, AppException>> insertNotificationToken(
    NotificationTokenRequestParam notificationTokenRequestParam,
  );
}
