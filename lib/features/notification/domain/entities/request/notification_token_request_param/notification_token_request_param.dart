import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_token_request_param.freezed.dart';
part 'notification_token_request_param.g.dart';

@freezed
class NotificationTokenRequestParam with _$NotificationTokenRequestParam {
  factory NotificationTokenRequestParam({
    String? deviceId,
    String? pushNotificationToken,
  }) = _NotificationTokenRequestParam;

  factory NotificationTokenRequestParam.fromJson(Map<String, dynamic> json) =>
      _$NotificationTokenRequestParamFromJson(json);
}
