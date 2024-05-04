// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_api_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseApiResult _$BaseApiResultFromJson(Map<String, dynamic> json) =>
    BaseApiResult(
      result: json['result'],
      message: json['message'] as String?,
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$BaseApiResultToJson(BaseApiResult instance) =>
    <String, dynamic>{
      'result': instance.result,
      'message': instance.message,
      'success': instance.success,
    };
