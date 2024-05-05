// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_device_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserDeviceModel _$UserDeviceModelFromJson(Map<String, dynamic> json) {
  return _UserDeviceModel.fromJson(json);
}

/// @nodoc
mixin _$UserDeviceModel {
  String? get id => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get model => throw _privateConstructorUsedError;
  String? get systemVersion => throw _privateConstructorUsedError;
  String? get deviceId => throw _privateConstructorUsedError;
  bool? get physicalDevice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDeviceModelCopyWith<UserDeviceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDeviceModelCopyWith<$Res> {
  factory $UserDeviceModelCopyWith(
          UserDeviceModel value, $Res Function(UserDeviceModel) then) =
      _$UserDeviceModelCopyWithImpl<$Res, UserDeviceModel>;
  @useResult
  $Res call(
      {String? id,
      String? userId,
      String? name,
      String? model,
      String? systemVersion,
      String? deviceId,
      bool? physicalDevice});
}

/// @nodoc
class _$UserDeviceModelCopyWithImpl<$Res, $Val extends UserDeviceModel>
    implements $UserDeviceModelCopyWith<$Res> {
  _$UserDeviceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? name = freezed,
    Object? model = freezed,
    Object? systemVersion = freezed,
    Object? deviceId = freezed,
    Object? physicalDevice = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
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
      physicalDevice: freezed == physicalDevice
          ? _value.physicalDevice
          : physicalDevice // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDeviceModelImplCopyWith<$Res>
    implements $UserDeviceModelCopyWith<$Res> {
  factory _$$UserDeviceModelImplCopyWith(_$UserDeviceModelImpl value,
          $Res Function(_$UserDeviceModelImpl) then) =
      __$$UserDeviceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? userId,
      String? name,
      String? model,
      String? systemVersion,
      String? deviceId,
      bool? physicalDevice});
}

/// @nodoc
class __$$UserDeviceModelImplCopyWithImpl<$Res>
    extends _$UserDeviceModelCopyWithImpl<$Res, _$UserDeviceModelImpl>
    implements _$$UserDeviceModelImplCopyWith<$Res> {
  __$$UserDeviceModelImplCopyWithImpl(
      _$UserDeviceModelImpl _value, $Res Function(_$UserDeviceModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? name = freezed,
    Object? model = freezed,
    Object? systemVersion = freezed,
    Object? deviceId = freezed,
    Object? physicalDevice = freezed,
  }) {
    return _then(_$UserDeviceModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
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
      physicalDevice: freezed == physicalDevice
          ? _value.physicalDevice
          : physicalDevice // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDeviceModelImpl implements _UserDeviceModel {
  _$UserDeviceModelImpl(
      {this.id,
      this.userId,
      this.name,
      this.model,
      this.systemVersion,
      this.deviceId,
      this.physicalDevice});

  factory _$UserDeviceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDeviceModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? userId;
  @override
  final String? name;
  @override
  final String? model;
  @override
  final String? systemVersion;
  @override
  final String? deviceId;
  @override
  final bool? physicalDevice;

  @override
  String toString() {
    return 'UserDeviceModel(id: $id, userId: $userId, name: $name, model: $model, systemVersion: $systemVersion, deviceId: $deviceId, physicalDevice: $physicalDevice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDeviceModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.systemVersion, systemVersion) ||
                other.systemVersion == systemVersion) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.physicalDevice, physicalDevice) ||
                other.physicalDevice == physicalDevice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, name, model,
      systemVersion, deviceId, physicalDevice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDeviceModelImplCopyWith<_$UserDeviceModelImpl> get copyWith =>
      __$$UserDeviceModelImplCopyWithImpl<_$UserDeviceModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDeviceModelImplToJson(
      this,
    );
  }
}

abstract class _UserDeviceModel implements UserDeviceModel {
  factory _UserDeviceModel(
      {final String? id,
      final String? userId,
      final String? name,
      final String? model,
      final String? systemVersion,
      final String? deviceId,
      final bool? physicalDevice}) = _$UserDeviceModelImpl;

  factory _UserDeviceModel.fromJson(Map<String, dynamic> json) =
      _$UserDeviceModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get userId;
  @override
  String? get name;
  @override
  String? get model;
  @override
  String? get systemVersion;
  @override
  String? get deviceId;
  @override
  bool? get physicalDevice;
  @override
  @JsonKey(ignore: true)
  _$$UserDeviceModelImplCopyWith<_$UserDeviceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
