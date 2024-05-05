import 'package:reprocare/common/base/model/request/pagination_request_param/pagination_request_param.dart';
import 'package:reprocare/common/base/result/base_result.dart';
import 'package:reprocare/common/mapper/api_model_mapper.dart';
import 'package:reprocare/common/network/http_client/http_client_api_url/http_client_end_points.dart';
import 'package:reprocare/common/network/http_client/manager/network_client.dart';
import 'package:reprocare/core/constants/network/http_call_type/http_call_type.dart';
import 'package:reprocare/features/notification/data/models/notification_model/notification_model.dart';
import 'package:reprocare/features/notification/data/models/notification_token_model/notification_token_model.dart';
import 'package:reprocare/features/notification/data/services/i_notification_service.dart';
import 'package:reprocare/features/notification/domain/entities/request/notification_token_request_param/notification_token_request_param.dart';

final class NotificationService implements INotificationService {
  final NetworkClient _networkClient;

  NotificationService(this._networkClient);
  @override
  Future<Result<List<NotificationModel>, AppException>> getNotifications(
    PaginationRequestParam paginationRequest,
  ) async {
    return await _networkClient.call(
      path: HttpClientEndPoints.GetNotifications.URL,
      callType: HttpCallType.GET,
      queryParameters: paginationRequest.toJson(),
      mapper: (json) => APIModelMapper.jsonToList<NotificationModel>(
        json,
        (json) => NotificationModel.fromJson(json),
      ),
    );
  }

  @override
  Future<Result<bool, AppException>> deleteNotification(
    String notificationId,
  ) async {
    return await _networkClient.call(
      path: HttpClientEndPoints.DeleteNotification.URL,
      callType: HttpCallType.DELETE,
      queryParameters: {
        'notificationId': notificationId,
      },
      mapper: (json) => true,
    );
  }

  @override
  Future<Result<bool, AppException>> readNotification(
      String notificationId) async {
    return await _networkClient.call(
      path: HttpClientEndPoints.ReadNotification.URL,
      callType: HttpCallType.PATCH,
      queryParameters: {
        'notificationId': notificationId,
      },
      mapper: (json) => true,
    );
  }

  @override
  Future<Result<NotificationTokenModel, AppException>> insertNotificationToken(
    NotificationTokenRequestParam notificationTokenRequestParam,
  ) async {
    return await _networkClient.call(
      path: HttpClientEndPoints.InsertNotificationToken.URL,
      callType: HttpCallType.POST,
      data: notificationTokenRequestParam,
      mapper: (json) => NotificationTokenModel.fromJson(json),
    );
  }
}
