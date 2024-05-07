import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reprocare/features/device/domain/entities/response/user_device_entity/user_device_entity.dart';

part 'notification_token_entity.freezed.dart';
part 'notification_token_entity.g.dart';

@freezed
class NotificationTokenEntity with _$NotificationTokenEntity {
  @JsonSerializable(explicitToJson: true)
  factory NotificationTokenEntity({
    String? userSecretId,
    String? deviceId,
    String? pushNotificationToken,
  }) = _NotificationTokenEntity;

  factory NotificationTokenEntity.fromJson(Map<String, dynamic> json) =>
      _$NotificationTokenEntityFromJson(json);
}
