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
  String? get userSecretId => throw _privateConstructorUsedError;
  String? get deviceId => throw _privateConstructorUsedError;
  String? get pushNotificationToken => throw _privateConstructorUsedError;

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
  $Res call(
      {String? userSecretId, String? deviceId, String? pushNotificationToken});
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
    Object? userSecretId = freezed,
    Object? deviceId = freezed,
    Object? pushNotificationToken = freezed,
  }) {
    return _then(_value.copyWith(
      userSecretId: freezed == userSecretId
          ? _value.userSecretId
          : userSecretId // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      pushNotificationToken: freezed == pushNotificationToken
          ? _value.pushNotificationToken
          : pushNotificationToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
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
  $Res call(
      {String? userSecretId, String? deviceId, String? pushNotificationToken});
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
    Object? userSecretId = freezed,
    Object? deviceId = freezed,
    Object? pushNotificationToken = freezed,
  }) {
    return _then(_$NotificationTokenModelImpl(
      userSecretId: freezed == userSecretId
          ? _value.userSecretId
          : userSecretId // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      pushNotificationToken: freezed == pushNotificationToken
          ? _value.pushNotificationToken
          : pushNotificationToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$NotificationTokenModelImpl implements _NotificationTokenModel {
  _$NotificationTokenModelImpl(
      {this.userSecretId, this.deviceId, this.pushNotificationToken});

  factory _$NotificationTokenModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationTokenModelImplFromJson(json);

  @override
  final String? userSecretId;
  @override
  final String? deviceId;
  @override
  final String? pushNotificationToken;

  @override
  String toString() {
    return 'NotificationTokenModel(userSecretId: $userSecretId, deviceId: $deviceId, pushNotificationToken: $pushNotificationToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationTokenModelImpl &&
            (identical(other.userSecretId, userSecretId) ||
                other.userSecretId == userSecretId) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.pushNotificationToken, pushNotificationToken) ||
                other.pushNotificationToken == pushNotificationToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userSecretId, deviceId, pushNotificationToken);

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
      {final String? userSecretId,
      final String? deviceId,
      final String? pushNotificationToken}) = _$NotificationTokenModelImpl;

  factory _NotificationTokenModel.fromJson(Map<String, dynamic> json) =
      _$NotificationTokenModelImpl.fromJson;

  @override
  String? get userSecretId;
  @override
  String? get deviceId;
  @override
  String? get pushNotificationToken;
  @override
  @JsonKey(ignore: true)
  _$$NotificationTokenModelImplCopyWith<_$NotificationTokenModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
