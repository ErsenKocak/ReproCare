import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_device_request_param.freezed.dart';
part 'user_device_request_param.g.dart';

@freezed
class UserDeviceRequestParam with _$UserDeviceRequestParam {
  factory UserDeviceRequestParam({
    String? name,
    String? model,
    String? systemVersion,
    String? deviceId,
    String? platform,
    String? language,
    bool? physicalDevice,
  }) = _UserDeviceRequestParam;

  factory UserDeviceRequestParam.fromJson(Map<String, dynamic> json) =>
      _$UserDeviceRequestParamFromJson(json);
}
