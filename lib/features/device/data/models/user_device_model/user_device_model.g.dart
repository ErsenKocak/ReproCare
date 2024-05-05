// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_device_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDeviceModelImpl _$$UserDeviceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserDeviceModelImpl(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      name: json['name'] as String?,
      model: json['model'] as String?,
      systemVersion: json['systemVersion'] as String?,
      deviceId: json['deviceId'] as String?,
      physicalDevice: json['physicalDevice'] as bool?,
    );

Map<String, dynamic> _$$UserDeviceModelImplToJson(
        _$UserDeviceModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'model': instance.model,
      'systemVersion': instance.systemVersion,
      'deviceId': instance.deviceId,
      'physicalDevice': instance.physicalDevice,
    };
