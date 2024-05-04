part of 'user_settings_cubit.dart';

@freezed
class UserSettingsState with _$UserSettingsState implements BaseState {
  const factory UserSettingsState.initial() = _Initial;
  const factory UserSettingsState.loading() = _Loading;
  const factory UserSettingsState.success() = _Success;

  const factory UserSettingsState.error(final String errorMessage) = _Error;
}
