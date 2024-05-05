import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
class NotificationModel with _$NotificationModel {
  factory NotificationModel({
    String? id,
    String? userId,
    String? messageTitle,
    String? messageBody,
    String? createdDate,
    int? notificationTypeId,
    bool? isSendSuccess,
    bool? isRead,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}
