// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_device_request_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserDeviceRequestParam _$UserDeviceRequestParamFromJson(
    Map<String, dynamic> json) {
  return _UserDeviceRequestParam.fromJson(json);
}

/// @nodoc
mixin _$UserDeviceRequestParam {
  String? get name => throw _privateConstructorUsedError;
  String? get model => throw _privateConstructorUsedError;
  String? get systemVersion => throw _privateConstructorUsedError;
  String? get deviceId => throw _privateConstructorUsedError;
  String? get platform => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;
  bool? get physicalDevice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDeviceRequestParamCopyWith<UserDeviceRequestParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDeviceRequestParamCopyWith<$Res> {
  factory $UserDeviceRequestParamCopyWith(UserDeviceRequestParam value,
          $Res Function(UserDeviceRequestParam) then) =
      _$UserDeviceRequestParamCopyWithImpl<$Res, UserDeviceRequestParam>;
  @useResult
  $Res call(
      {String? name,
      String? model,
      String? systemVersion,
      String? deviceId,
      String? platform,
      String? language,
      bool? physicalDevice});
}

/// @nodoc
class _$UserDeviceRequestParamCopyWithImpl<$Res,
        $Val extends UserDeviceRequestParam>
    implements $UserDeviceRequestParamCopyWith<$Res> {
  _$UserDeviceRequestParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? model = freezed,
    Object? systemVersion = freezed,
    Object? deviceId = freezed,
    Object? platform = freezed,
    Object? language = freezed,
    Object? physicalDevice = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      systemVersion: freezed == systemVersion
          ? _value.systemVersion
          : systemVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      platform: freezed == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      physicalDevice: freezed == physicalDevice
          ? _value.physicalDevice
          : physicalDevice // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDeviceRequestParamImplCopyWith<$Res>
    implements $UserDeviceRequestParamCopyWith<$Res> {
  factory _$$UserDeviceRequestParamImplCopyWith(
          _$UserDeviceRequestParamImpl value,
          $Res Function(_$UserDeviceRequestParamImpl) then) =
      __$$UserDeviceRequestParamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? model,
      String? systemVersion,
      String? deviceId,
      String? platform,
      String? language,
      bool? physicalDevice});
}

/// @nodoc
class __$$UserDeviceRequestParamImplCopyWithImpl<$Res>
    extends _$UserDeviceRequestParamCopyWithImpl<$Res,
        _$UserDeviceRequestParamImpl>
    implements _$$UserDeviceRequestParamImplCopyWith<$Res> {
  __$$UserDeviceRequestParamImplCopyWithImpl(
      _$UserDeviceRequestParamImpl _value,
      $Res Function(_$UserDeviceRequestParamImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? model = freezed,
    Object? systemVersion = freezed,
    Object? deviceId = freezed,
    Object? platform = freezed,
    Object? language = freezed,
    Object? physicalDevice = freezed,
  }) {
    return _then(_$UserDeviceRequestParamImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      systemVersion: freezed == systemVersion
          ? _value.systemVersion
          : systemVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      platform: freezed == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      physicalDevice: freezed == physicalDevice
          ? _value.physicalDevice
          : physicalDevice // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDeviceRequestParamImpl implements _UserDeviceRequestParam {
  _$UserDeviceRequestParamImpl(
      {this.name,
      this.model,
      this.systemVersion,
      this.deviceId,
      this.platform,
      this.language,
      this.physicalDevice});

  factory _$UserDeviceRequestParamImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDeviceRequestParamImplFromJson(json);

  @override
  final String? name;
  @override
  final String? model;
  @override
  final String? systemVersion;
  @override
  final String? deviceId;
  @override
  final String? platform;
  @override
  final String? language;
  @override
  final bool? physicalDevice;

  @override
  String toString() {
    return 'UserDeviceRequestParam(name: $name, model: $model, systemVersion: $systemVersion, deviceId: $deviceId, platform: $platform, language: $language, physicalDevice: $physicalDevice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDeviceRequestParamImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.systemVersion, systemVersion) ||
                other.systemVersion == systemVersion) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.physicalDevice, physicalDevice) ||
                other.physicalDevice == physicalDevice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, model, systemVersion,
      deviceId, platform, language, physicalDevice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDeviceRequestParamImplCopyWith<_$UserDeviceRequestParamImpl>
      get copyWith => __$$UserDeviceRequestParamImplCopyWithImpl<
          _$UserDeviceRequestParamImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDeviceRequestParamImplToJson(
      this,
    );
  }
}

abstract class _UserDeviceRequestParam implements UserDeviceRequestParam {
  factory _UserDeviceRequestParam(
      {final String? name,
      final String? model,
      final String? systemVersion,
      final String? deviceId,
      final String? platform,
      final String? language,
      final bool? physicalDevice}) = _$UserDeviceRequestParamImpl;

  factory _UserDeviceRequestParam.fromJson(Map<String, dynamic> json) =
      _$UserDeviceRequestParamImpl.fromJson;

  @override
  String? get name;
  @override
  String? get model;
  @override
  String? get systemVersion;
  @override
  String? get deviceId;
  @override
  String? get platform;
  @override
  String? get language;
  @override
  bool? get physicalDevice;
  @override
  @JsonKey(ignore: true)
  _$$UserDeviceRequestParamImplCopyWith<_$UserDeviceRequestParamImpl>
      get copyWith => throw _privateConstructorUsedError;
}
