import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_device_model.freezed.dart';
part 'user_device_model.g.dart';

@freezed
class UserDeviceModel with _$UserDeviceModel {
  factory UserDeviceModel({
    String? id,
    String? userId,
    String? name,
    String? model,
    String? systemVersion,
    String? deviceId,
    bool? physicalDevice,
  }) = _UserDeviceModel;

  factory UserDeviceModel.fromJson(Map<String, dynamic> json) =>
      _$UserDeviceModelFromJson(json);
}
