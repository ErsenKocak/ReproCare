// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationTokenModelImpl _$$NotificationTokenModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationTokenModelImpl(
      id: json['id'] as String?,
      device: json['device'] == null
          ? null
          : UserDeviceModel.fromJson(json['device'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$$NotificationTokenModelImplToJson(
        _$NotificationTokenModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'device': instance.device?.toJson(),
      'token': instance.token,
    };
