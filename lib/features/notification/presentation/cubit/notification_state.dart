part of 'notification_cubit.dart';

@freezed
class NotificationState with _$NotificationState implements BaseState {
  const factory NotificationState.initial() = _Initial;
  const factory NotificationState.loading() = _Loading;
  const factory NotificationState.listSuccess() = _ListSuccess;
  const factory NotificationState.readSuccess() = _ReadSuccess;
  const factory NotificationState.deleteSuccess() = _DeleteSuccess;
  const factory NotificationState.insertSuccess() = _InsertSucccess;
  const factory NotificationState.failure(String errorMessage) = _Failure;
}
