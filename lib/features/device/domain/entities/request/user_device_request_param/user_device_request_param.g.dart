// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_device_request_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDeviceRequestParamImpl _$$UserDeviceRequestParamImplFromJson(
        Map<String, dynamic> json) =>
    _$UserDeviceRequestParamImpl(
      name: json['name'] as String?,
      model: json['model'] as String?,
      systemVersion: json['systemVersion'] as String?,
      deviceId: json['deviceId'] as String?,
      platform: json['platform'] as String?,
      language: json['language'] as String?,
      physicalDevice: json['physicalDevice'] as bool?,
    );

Map<String, dynamic> _$$UserDeviceRequestParamImplToJson(
        _$UserDeviceRequestParamImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'model': instance.model,
      'systemVersion': instance.systemVersion,
      'deviceId': instance.deviceId,
      'platform': instance.platform,
      'language': instance.language,
      'physicalDevice': instance.physicalDevice,
    };
