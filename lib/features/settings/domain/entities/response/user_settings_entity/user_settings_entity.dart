import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_settings_entity.freezed.dart';
part 'user_settings_entity.g.dart';

@freezed
class UserSettingsEntity with _$UserSettingsEntity {
  @JsonSerializable(explicitToJson: true)
  factory UserSettingsEntity({
    bool? isNotificationActive,
  }) = _UserSettingsEntity;

  factory UserSettingsEntity.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsEntityFromJson(json);
}
