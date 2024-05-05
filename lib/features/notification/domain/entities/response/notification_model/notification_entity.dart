import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_entity.freezed.dart';
part 'notification_entity.g.dart';

@freezed
class NotificationEntity with _$NotificationEntity {
  factory NotificationEntity({
    String? id,
    String? userId,
    String? messageTitle,
    String? messageBody,
    String? createdDate,
    int? notificationTypeId,
    bool? isSendSuccess,
    bool? isRead,
  }) = _NotificationEntity;

  factory NotificationEntity.fromJson(Map<String, dynamic> json) =>
      _$NotificationEntityFromJson(json);
}
