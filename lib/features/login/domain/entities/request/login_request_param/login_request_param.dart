import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_request_param.freezed.dart';
part 'login_request_param.g.dart';

@freezed
class LoginRequestParam with _$LoginRequestParam {
  factory LoginRequestParam({
    required String email,
    required String password,
  }) = _LoginRequestParam;

  factory LoginRequestParam.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestParamFromJson(json);
}
