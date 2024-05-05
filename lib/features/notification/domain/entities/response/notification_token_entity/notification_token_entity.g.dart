// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_token_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationTokenEntityImpl _$$NotificationTokenEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationTokenEntityImpl(
      id: json['id'] as String?,
      device: json['device'] == null
          ? null
          : UserDeviceEntity.fromJson(json['device'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$$NotificationTokenEntityImplToJson(
        _$NotificationTokenEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'device': instance.device?.toJson(),
      'token': instance.token,
    };
