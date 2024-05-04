import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_request_param.freezed.dart';
part 'pagination_request_param.g.dart';

@freezed
class PaginationRequestParam with _$PaginationRequestParam {
  @JsonSerializable(explicitToJson: true)
  factory PaginationRequestParam({
    required int page,
    required int size,
    List<String>? sort,
  }) = _PaginationRequestParam;

  factory PaginationRequestParam.fromJson(Map<String, dynamic> json) =>
      _$PaginationRequestParamFromJson(json);
}
