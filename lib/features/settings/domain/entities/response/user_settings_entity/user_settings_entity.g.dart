// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserSettingsEntityImpl _$$UserSettingsEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$UserSettingsEntityImpl(
      isNotificationActive: json['isNotificationActive'] as bool?,
      soundName: json['soundName'] as String?,
    );

Map<String, dynamic> _$$UserSettingsEntityImplToJson(
        _$UserSettingsEntityImpl instance) =>
    <String, dynamic>{
      'isNotificationActive': instance.isNotificationActive,
      'soundName': instance.soundName,
    };
