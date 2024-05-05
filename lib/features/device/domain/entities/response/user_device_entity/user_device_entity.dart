import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_device_entity.freezed.dart';
part 'user_device_entity.g.dart';

@freezed
class UserDeviceEntity with _$UserDeviceEntity {
  factory UserDeviceEntity({
    String? id,
    String? userId,
    String? name,
    String? model,
    String? systemVersion,
    String? deviceId,
    bool? physicalDevice,
  }) = _UserDeviceEntity;

  factory UserDeviceEntity.fromJson(Map<String, dynamic> json) =>
      _$UserDeviceEntityFromJson(json);
}
