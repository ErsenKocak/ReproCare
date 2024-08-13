import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_token_model.freezed.dart';
part 'notification_token_model.g.dart';

@freezed
class NotificationTokenModel with _$NotificationTokenModel {
  @JsonSerializable(explicitToJson: true)
  factory NotificationTokenModel({
    String? userSecretId,
    String? deviceId,
    String? pushNotificationToken,
  }) = _NotificationTokenModel;

  factory NotificationTokenModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationTokenModelFromJson(json);
}
