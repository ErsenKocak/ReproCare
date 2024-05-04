// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_request_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginationRequestParamImpl _$$PaginationRequestParamImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginationRequestParamImpl(
      page: (json['page'] as num).toInt(),
      size: (json['size'] as num).toInt(),
      sort: (json['sort'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$PaginationRequestParamImplToJson(
        _$PaginationRequestParamImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'size': instance.size,
      'sort': instance.sort,
    };
