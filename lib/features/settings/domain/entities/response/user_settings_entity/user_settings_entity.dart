import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reprocare/features/settings/domain/entities/response/user_settings_entity/user_entity.dart';

part 'user_settings_entity.freezed.dart';
part 'user_settings_entity.g.dart';

@freezed
class UserSettingsEntity with _$UserSettingsEntity {
  @JsonSerializable(explicitToJson: true)
  factory UserSettingsEntity({
    String? id,
    String? language,
    int? pomodoroTime,
    int? shortBreakTime,
    int? longBreakTime,
    int? longBreakPomodoroNumber,
    bool? startPomodoroAutomaticly,
    bool? startBreakAutomaticly,
    bool? noBreak,
    bool? useSystemTimeConfig,
    int? startWeekday,
    bool? pm,
    UserEntity? user,
  }) = _UserSettingsEntity;

  factory UserSettingsEntity.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsEntityFromJson(json);
}
