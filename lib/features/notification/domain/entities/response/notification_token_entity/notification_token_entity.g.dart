// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_token_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationTokenEntityImpl _$$NotificationTokenEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationTokenEntityImpl(
      userSecretId: json['userSecretId'] as String?,
      deviceId: json['deviceId'] as String?,
      pushNotificationToken: json['pushNotificationToken'] as String?,
    );

Map<String, dynamic> _$$NotificationTokenEntityImplToJson(
        _$NotificationTokenEntityImpl instance) =>
    <String, dynamic>{
      'userSecretId': instance.userSecretId,
      'deviceId': instance.deviceId,
      'pushNotificationToken': instance.pushNotificationToken,
    };
