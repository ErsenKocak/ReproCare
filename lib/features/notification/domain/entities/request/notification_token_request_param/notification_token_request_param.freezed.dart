// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_token_request_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotificationTokenRequestParam _$NotificationTokenRequestParamFromJson(
    Map<String, dynamic> json) {
  return _NotificationTokenRequestParam.fromJson(json);
}

/// @nodoc
mixin _$NotificationTokenRequestParam {
  String? get deviceId => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationTokenRequestParamCopyWith<NotificationTokenRequestParam>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationTokenRequestParamCopyWith<$Res> {
  factory $NotificationTokenRequestParamCopyWith(
          NotificationTokenRequestParam value,
          $Res Function(NotificationTokenRequestParam) then) =
      _$NotificationTokenRequestParamCopyWithImpl<$Res,
          NotificationTokenRequestParam>;
  @useResult
  $Res call({String? deviceId, String? token});
}

/// @nodoc
class _$NotificationTokenRequestParamCopyWithImpl<$Res,
        $Val extends NotificationTokenRequestParam>
    implements $NotificationTokenRequestParamCopyWith<$Res> {
  _$NotificationTokenRequestParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = freezed,
    Object? token = freezed,
  }) {
    return _then(_value.copyWith(
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationTokenRequestParamImplCopyWith<$Res>
    implements $NotificationTokenRequestParamCopyWith<$Res> {
  factory _$$NotificationTokenRequestParamImplCopyWith(
          _$NotificationTokenRequestParamImpl value,
          $Res Function(_$NotificationTokenRequestParamImpl) then) =
      __$$NotificationTokenRequestParamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? deviceId, String? token});
}

/// @nodoc
class __$$NotificationTokenRequestParamImplCopyWithImpl<$Res>
    extends _$NotificationTokenRequestParamCopyWithImpl<$Res,
        _$NotificationTokenRequestParamImpl>
    implements _$$NotificationTokenRequestParamImplCopyWith<$Res> {
  __$$NotificationTokenRequestParamImplCopyWithImpl(
      _$NotificationTokenRequestParamImpl _value,
      $Res Function(_$NotificationTokenRequestParamImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = freezed,
    Object? token = freezed,
  }) {
    return _then(_$NotificationTokenRequestParamImpl(
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationTokenRequestParamImpl
    implements _NotificationTokenRequestParam {
  _$NotificationTokenRequestParamImpl({this.deviceId, this.token});

  factory _$NotificationTokenRequestParamImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$NotificationTokenRequestParamImplFromJson(json);

  @override
  final String? deviceId;
  @override
  final String? token;

  @override
  String toString() {
    return 'NotificationTokenRequestParam(deviceId: $deviceId, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationTokenRequestParamImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, deviceId, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationTokenRequestParamImplCopyWith<
          _$NotificationTokenRequestParamImpl>
      get copyWith => __$$NotificationTokenRequestParamImplCopyWithImpl<
          _$NotificationTokenRequestParamImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationTokenRequestParamImplToJson(
      this,
    );
  }
}

abstract class _NotificationTokenRequestParam
    implements NotificationTokenRequestParam {
  factory _NotificationTokenRequestParam(
      {final String? deviceId,
      final String? token}) = _$NotificationTokenRequestParamImpl;

  factory _NotificationTokenRequestParam.fromJson(Map<String, dynamic> json) =
      _$NotificationTokenRequestParamImpl.fromJson;

  @override
  String? get deviceId;
  @override
  String? get token;
  @override
  @JsonKey(ignore: true)
  _$$NotificationTokenRequestParamImplCopyWith<
          _$NotificationTokenRequestParamImpl>
      get copyWith => throw _privateConstructorUsedError;
}
