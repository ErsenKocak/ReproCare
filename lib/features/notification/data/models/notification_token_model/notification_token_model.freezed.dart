// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_token_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotificationTokenModel _$NotificationTokenModelFromJson(
    Map<String, dynamic> json) {
  return _NotificationTokenModel.fromJson(json);
}

/// @nodoc
mixin _$NotificationTokenModel {
  String? get id => throw _privateConstructorUsedError;
  UserDeviceModel? get device => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationTokenModelCopyWith<NotificationTokenModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationTokenModelCopyWith<$Res> {
  factory $NotificationTokenModelCopyWith(NotificationTokenModel value,
          $Res Function(NotificationTokenModel) then) =
      _$NotificationTokenModelCopyWithImpl<$Res, NotificationTokenModel>;
  @useResult
  $Res call({String? id, UserDeviceModel? device, String? token});

  $UserDeviceModelCopyWith<$Res>? get device;
}

/// @nodoc
class _$NotificationTokenModelCopyWithImpl<$Res,
        $Val extends NotificationTokenModel>
    implements $NotificationTokenModelCopyWith<$Res> {
  _$NotificationTokenModelCopyWithImpl(this._value, this._then);

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
              as UserDeviceModel?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDeviceModelCopyWith<$Res>? get device {
    if (_value.device == null) {
      return null;
    }

    return $UserDeviceModelCopyWith<$Res>(_value.device!, (value) {
      return _then(_value.copyWith(device: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NotificationTokenModelImplCopyWith<$Res>
    implements $NotificationTokenModelCopyWith<$Res> {
  factory _$$NotificationTokenModelImplCopyWith(
          _$NotificationTokenModelImpl value,
          $Res Function(_$NotificationTokenModelImpl) then) =
      __$$NotificationTokenModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, UserDeviceModel? device, String? token});

  @override
  $UserDeviceModelCopyWith<$Res>? get device;
}

/// @nodoc
class __$$NotificationTokenModelImplCopyWithImpl<$Res>
    extends _$NotificationTokenModelCopyWithImpl<$Res,
        _$NotificationTokenModelImpl>
    implements _$$NotificationTokenModelImplCopyWith<$Res> {
  __$$NotificationTokenModelImplCopyWithImpl(
      _$NotificationTokenModelImpl _value,
      $Res Function(_$NotificationTokenModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? device = freezed,
    Object? token = freezed,
  }) {
    return _then(_$NotificationTokenModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      device: freezed == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as UserDeviceModel?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$NotificationTokenModelImpl implements _NotificationTokenModel {
  _$NotificationTokenModelImpl({this.id, this.device, this.token});

  factory _$NotificationTokenModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationTokenModelImplFromJson(json);

  @override
  final String? id;
  @override
  final UserDeviceModel? device;
  @override
  final String? token;

  @override
  String toString() {
    return 'NotificationTokenModel(id: $id, device: $device, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationTokenModelImpl &&
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
  _$$NotificationTokenModelImplCopyWith<_$NotificationTokenModelImpl>
      get copyWith => __$$NotificationTokenModelImplCopyWithImpl<
          _$NotificationTokenModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationTokenModelImplToJson(
      this,
    );
  }
}

abstract class _NotificationTokenModel implements NotificationTokenModel {
  factory _NotificationTokenModel(
      {final String? id,
      final UserDeviceModel? device,
      final String? token}) = _$NotificationTokenModelImpl;

  factory _NotificationTokenModel.fromJson(Map<String, dynamic> json) =
      _$NotificationTokenModelImpl.fromJson;

  @override
  String? get id;
  @override
  UserDeviceModel? get device;
  @override
  String? get token;
  @override
  @JsonKey(ignore: true)
  _$$NotificationTokenModelImplCopyWith<_$NotificationTokenModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
