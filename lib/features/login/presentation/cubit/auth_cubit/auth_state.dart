part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState implements BaseState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.success(
    final UserEntity loginResponseEntity,
  ) = _Success;

  const factory AuthState.error(String errorMessage) = _Error;
}
