// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationEntityImpl _$$NotificationEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationEntityImpl(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['userId'] as num?)?.toInt(),
      userSecretID: json['userSecretID'] as String?,
      messageTitle: json['messageTitle'] as String?,
      messageBody: json['messageBody'] as String?,
      createdDate: json['createdDate'] as String?,
      notificationTypeId: (json['notificationTypeId'] as num?)?.toInt(),
      isSendSuccess: json['isSendSuccess'] as bool?,
      isRead: json['isRead'] as bool?,
    );

Map<String, dynamic> _$$NotificationEntityImplToJson(
        _$NotificationEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'userSecretID': instance.userSecretID,
      'messageTitle': instance.messageTitle,
      'messageBody': instance.messageBody,
      'createdDate': instance.createdDate,
      'notificationTypeId': instance.notificationTypeId,
      'isSendSuccess': instance.isSendSuccess,
      'isRead': instance.isRead,
    };
