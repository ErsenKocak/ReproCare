// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_request_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginRequestParam _$LoginRequestParamFromJson(Map<String, dynamic> json) {
  return _LoginRequestParam.fromJson(json);
}

/// @nodoc
mixin _$LoginRequestParam {
  String get phoneNumber => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginRequestParamCopyWith<LoginRequestParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginRequestParamCopyWith<$Res> {
  factory $LoginRequestParamCopyWith(
          LoginRequestParam value, $Res Function(LoginRequestParam) then) =
      _$LoginRequestParamCopyWithImpl<$Res, LoginRequestParam>;
  @useResult
  $Res call({String phoneNumber, String password});
}

/// @nodoc
class _$LoginRequestParamCopyWithImpl<$Res, $Val extends LoginRequestParam>
    implements $LoginRequestParamCopyWith<$Res> {
  _$LoginRequestParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginRequestParamImplCopyWith<$Res>
    implements $LoginRequestParamCopyWith<$Res> {
  factory _$$LoginRequestParamImplCopyWith(_$LoginRequestParamImpl value,
          $Res Function(_$LoginRequestParamImpl) then) =
      __$$LoginRequestParamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String phoneNumber, String password});
}

/// @nodoc
class __$$LoginRequestParamImplCopyWithImpl<$Res>
    extends _$LoginRequestParamCopyWithImpl<$Res, _$LoginRequestParamImpl>
    implements _$$LoginRequestParamImplCopyWith<$Res> {
  __$$LoginRequestParamImplCopyWithImpl(_$LoginRequestParamImpl _value,
      $Res Function(_$LoginRequestParamImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? password = null,
  }) {
    return _then(_$LoginRequestParamImpl(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginRequestParamImpl implements _LoginRequestParam {
  _$LoginRequestParamImpl({required this.phoneNumber, required this.password});

  factory _$LoginRequestParamImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginRequestParamImplFromJson(json);

  @override
  final String phoneNumber;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginRequestParam(phoneNumber: $phoneNumber, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginRequestParamImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginRequestParamImplCopyWith<_$LoginRequestParamImpl> get copyWith =>
      __$$LoginRequestParamImplCopyWithImpl<_$LoginRequestParamImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginRequestParamImplToJson(
      this,
    );
  }
}

abstract class _LoginRequestParam implements LoginRequestParam {
  factory _LoginRequestParam(
      {required final String phoneNumber,
      required final String password}) = _$LoginRequestParamImpl;

  factory _LoginRequestParam.fromJson(Map<String, dynamic> json) =
      _$LoginRequestParamImpl.fromJson;

  @override
  String get phoneNumber;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$LoginRequestParamImplCopyWith<_$LoginRequestParamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
