part of 'device_cubit.dart';

@freezed
class DeviceState with _$DeviceState implements BaseState {
  const factory DeviceState.initial() = _Initial;
  const factory DeviceState.loading() = _Loading;
  const factory DeviceState.listSuccess() = _ListSuccess;
  const factory DeviceState.insertSuccess() = _InsertSuccess;
  const factory DeviceState.deviceLanguageUpdateSuccess() =
      _DeviceLanguageUpdateSuccess;
  const factory DeviceState.error(String errorMessage) = _Error;
}
