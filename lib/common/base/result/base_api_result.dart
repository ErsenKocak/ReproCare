import 'package:json_annotation/json_annotation.dart';

part 'base_api_result.g.dart';

@JsonSerializable()
class BaseApiResult {
  final dynamic result;
  final String? message;
  final bool? success;

  const BaseApiResult({this.result, this.message, this.success});

  factory BaseApiResult.fromJson(Map<String, dynamic> json) {
    return _$BaseApiResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BaseApiResultToJson(this);
}
