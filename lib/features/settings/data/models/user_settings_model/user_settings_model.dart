import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_settings_model.freezed.dart';
part 'user_settings_model.g.dart';

@freezed
class UserSettingsModel with _$UserSettingsModel {
  @JsonSerializable(explicitToJson: true)
  factory UserSettingsModel({
    bool? isNotificationActive,
  }) = _UserSettingsModel;

  factory UserSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsModelFromJson(json);
}
