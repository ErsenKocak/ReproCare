// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_token_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotificationTokenEntity _$NotificationTokenEntityFromJson(
    Map<String, dynamic> json) {
  return _NotificationTokenEntity.fromJson(json);
}

/// @nodoc
mixin _$NotificationTokenEntity {
  String? get id => throw _privateConstructorUsedError;
  UserDeviceEntity? get device => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationTokenEntityCopyWith<NotificationTokenEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationTokenEntityCopyWith<$Res> {
  factory $NotificationTokenEntityCopyWith(NotificationTokenEntity value,
          $Res Function(NotificationTokenEntity) then) =
      _$NotificationTokenEntityCopyWithImpl<$Res, NotificationTokenEntity>;
  @useResult
  $Res call({String? id, UserDeviceEntity? device, String? token});

  $UserDeviceEntityCopyWith<$Res>? get device;
}

/// @nodoc
class _$NotificationTokenEntityCopyWithImpl<$Res,
        $Val extends NotificationTokenEntity>
    implements $NotificationTokenEntityCopyWith<$Res> {
  _$NotificationTokenEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? device = freezed,
    Object? token = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      device: freezed == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as UserDeviceEntity?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDeviceEntityCopyWith<$Res>? get device {
    if (_value.device == null) {
      return null;
    }

    return $UserDeviceEntityCopyWith<$Res>(_value.device!, (value) {
      return _then(_value.copyWith(device: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NotificationTokenEntityImplCopyWith<$Res>
    implements $NotificationTokenEntityCopyWith<$Res> {
  factory _$$NotificationTokenEntityImplCopyWith(
          _$NotificationTokenEntityImpl value,
          $Res Function(_$NotificationTokenEntityImpl) then) =
      __$$NotificationTokenEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, UserDeviceEntity? device, String? token});

  @override
  $UserDeviceEntityCopyWith<$Res>? get device;
}

/// @nodoc
class __$$NotificationTokenEntityImplCopyWithImpl<$Res>
    extends _$NotificationTokenEntityCopyWithImpl<$Res,
        _$NotificationTokenEntityImpl>
    implements _$$NotificationTokenEntityImplCopyWith<$Res> {
  __$$NotificationTokenEntityImplCopyWithImpl(
      _$NotificationTokenEntityImpl _value,
      $Res Function(_$NotificationTokenEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? device = freezed,
    Object? token = freezed,
  }) {
    return _then(_$NotificationTokenEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      device: freezed == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as UserDeviceEntity?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$NotificationTokenEntityImpl implements _NotificationTokenEntity {
  _$NotificationTokenEntityImpl({this.id, this.device, this.token});

  factory _$NotificationTokenEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationTokenEntityImplFromJson(json);

  @override
  final String? id;
  @override
  final UserDeviceEntity? device;
  @override
  final String? token;

  @override
  String toString() {
    return 'NotificationTokenEntity(id: $id, device: $device, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationTokenEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.device, device) || other.device == device) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, device, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationTokenEntityImplCopyWith<_$NotificationTokenEntityImpl>
      get copyWith => __$$NotificationTokenEntityImplCopyWithImpl<
          _$NotificationTokenEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationTokenEntityImplToJson(
      this,
    );
  }
}

abstract class _NotificationTokenEntity implements NotificationTokenEntity {
  factory _NotificationTokenEntity(
      {final String? id,
      final UserDeviceEntity? device,
      final String? token}) = _$NotificationTokenEntityImpl;

  factory _NotificationTokenEntity.fromJson(Map<String, dynamic> json) =
      _$NotificationTokenEntityImpl.fromJson;

  @override
  String? get id;
  @override
  UserDeviceEntity? get device;
  @override
  String? get token;
  @override
  @JsonKey(ignore: true)
  _$$NotificationTokenEntityImplCopyWith<_$NotificationTokenEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
