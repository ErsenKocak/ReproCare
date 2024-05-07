import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reprocare/features/device/data/models/user_device_model/user_device_model.dart';

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
