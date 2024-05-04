// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserSettingsModelImpl _$$UserSettingsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserSettingsModelImpl(
      id: json['id'] as String?,
      language: json['language'] as String?,
      pomodoroTime: (json['pomodoroTime'] as num?)?.toInt(),
      shortBreakTime: (json['shortBreakTime'] as num?)?.toInt(),
      longBreakTime: (json['longBreakTime'] as num?)?.toInt(),
      longBreakPomodoroNumber:
          (json['longBreakPomodoroNumber'] as num?)?.toInt(),
      startPomodoroAutomaticly: json['startPomodoroAutomaticly'] as bool?,
      startBreakAutomaticly: json['startBreakAutomaticly'] as bool?,
      noBreak: json['noBreak'] as bool?,
      useSystemTimeConfig: json['useSystemTimeConfig'] as bool?,
      startWeekday: (json['startWeekday'] as num?)?.toInt(),
      pm: json['pm'] as bool?,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserSettingsModelImplToJson(
        _$UserSettingsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'language': instance.language,
      'pomodoroTime': instance.pomodoroTime,
      'shortBreakTime': instance.shortBreakTime,
      'longBreakTime': instance.longBreakTime,
      'longBreakPomodoroNumber': instance.longBreakPomodoroNumber,
      'startPomodoroAutomaticly': instance.startPomodoroAutomaticly,
      'startBreakAutomaticly': instance.startBreakAutomaticly,
      'noBreak': instance.noBreak,
      'useSystemTimeConfig': instance.useSystemTimeConfig,
      'startWeekday': instance.startWeekday,
      'pm': instance.pm,
      'user': instance.user?.toJson(),
    };
