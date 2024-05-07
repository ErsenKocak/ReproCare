// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationTokenModelImpl _$$NotificationTokenModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationTokenModelImpl(
      userSecretId: json['userSecretId'] as String?,
      deviceId: json['deviceId'] as String?,
      pushNotificationToken: json['pushNotificationToken'] as String?,
    );

Map<String, dynamic> _$$NotificationTokenModelImplToJson(
        _$NotificationTokenModelImpl instance) =>
    <String, dynamic>{
      'userSecretId': instance.userSecretId,
      'deviceId': instance.deviceId,
      'pushNotificationToken': instance.pushNotificationToken,
    };
