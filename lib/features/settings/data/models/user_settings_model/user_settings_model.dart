import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reprocare/features/login/data/models/user_model/user_model.dart';

part 'user_settings_model.freezed.dart';
part 'user_settings_model.g.dart';

@freezed
class UserSettingsModel with _$UserSettingsModel {
  @JsonSerializable(explicitToJson: true)
  factory UserSettingsModel({
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
    UserModel? user,
  }) = _UserSettingsModel;

  factory UserSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsModelFromJson(json);
}
