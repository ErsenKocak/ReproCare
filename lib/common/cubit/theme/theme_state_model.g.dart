// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ThemeStateModelImpl _$$ThemeStateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ThemeStateModelImpl(
      themeMode:
          $enumDecodeNullable(_$ThemeModeEnumEnumMap, json['themeMode']) ??
              ThemeModeEnum.System,
    );

Map<String, dynamic> _$$ThemeStateModelImplToJson(
        _$ThemeStateModelImpl instance) =>
    <String, dynamic>{
      'themeMode': _$ThemeModeEnumEnumMap[instance.themeMode]!,
    };

const _$ThemeModeEnumEnumMap = {
  ThemeModeEnum.System: 'System',
  ThemeModeEnum.Light: 'Light',
  ThemeModeEnum.Dark: 'Dark',
};
