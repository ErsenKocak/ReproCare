import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_settings_request.freezed.dart';
part 'user_settings_request.g.dart';

@freezed
class UserSettingsRequest with _$UserSettingsRequest {
  factory UserSettingsRequest({
    bool? isNotificationActive,
  }) = _UserSettingsRequest;

  factory UserSettingsRequest.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsRequestFromJson(json);
}
