// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_request_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaginationRequestParam _$PaginationRequestParamFromJson(
    Map<String, dynamic> json) {
  return _PaginationRequestParam.fromJson(json);
}

/// @nodoc
mixin _$PaginationRequestParam {
  int get page => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  List<String>? get sort => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginationRequestParamCopyWith<PaginationRequestParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationRequestParamCopyWith<$Res> {
  factory $PaginationRequestParamCopyWith(PaginationRequestParam value,
          $Res Function(PaginationRequestParam) then) =
      _$PaginationRequestParamCopyWithImpl<$Res, PaginationRequestParam>;
  @useResult
  $Res call({int page, int size, List<String>? sort});
}

/// @nodoc
class _$PaginationRequestParamCopyWithImpl<$Res,
        $Val extends PaginationRequestParam>
    implements $PaginationRequestParamCopyWith<$Res> {
  _$PaginationRequestParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? size = null,
    Object? sort = freezed,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      sort: freezed == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationRequestParamImplCopyWith<$Res>
    implements $PaginationRequestParamCopyWith<$Res> {
  factory _$$PaginationRequestParamImplCopyWith(
          _$PaginationRequestParamImpl value,
          $Res Function(_$PaginationRequestParamImpl) then) =
      __$$PaginationRequestParamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page, int size, List<String>? sort});
}

/// @nodoc
class __$$PaginationRequestParamImplCopyWithImpl<$Res>
    extends _$PaginationRequestParamCopyWithImpl<$Res,
        _$PaginationRequestParamImpl>
    implements _$$PaginationRequestParamImplCopyWith<$Res> {
  __$$PaginationRequestParamImplCopyWithImpl(
      _$PaginationRequestParamImpl _value,
      $Res Function(_$PaginationRequestParamImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? size = null,
    Object? sort = freezed,
  }) {
    return _then(_$PaginationRequestParamImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      sort: freezed == sort
          ? _value._sort
          : sort // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$PaginationRequestParamImpl implements _PaginationRequestParam {
  _$PaginationRequestParamImpl(
      {required this.page, required this.size, final List<String>? sort})
      : _sort = sort;

  factory _$PaginationRequestParamImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationRequestParamImplFromJson(json);

  @override
  final int page;
  @override
  final int size;
  final List<String>? _sort;
  @override
  List<String>? get sort {
    final value = _sort;
    if (value == null) return null;
    if (_sort is EqualUnmodifiableListView) return _sort;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PaginationRequestParam(page: $page, size: $size, sort: $sort)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationRequestParamImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.size, size) || other.size == size) &&
            const DeepCollectionEquality().equals(other._sort, _sort));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, page, size, const DeepCollectionEquality().hash(_sort));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationRequestParamImplCopyWith<_$PaginationRequestParamImpl>
      get copyWith => __$$PaginationRequestParamImplCopyWithImpl<
          _$PaginationRequestParamImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginationRequestParamImplToJson(
      this,
    );
  }
}

abstract class _PaginationRequestParam implements PaginationRequestParam {
  factory _PaginationRequestParam(
      {required final int page,
      required final int size,
      final List<String>? sort}) = _$PaginationRequestParamImpl;

  factory _PaginationRequestParam.fromJson(Map<String, dynamic> json) =
      _$PaginationRequestParamImpl.fromJson;

  @override
  int get page;
  @override
  int get size;
  @override
  List<String>? get sort;
  @override
  @JsonKey(ignore: true)
  _$$PaginationRequestParamImplCopyWith<_$PaginationRequestParamImpl>
      get copyWith => throw _privateConstructorUsedError;
}
