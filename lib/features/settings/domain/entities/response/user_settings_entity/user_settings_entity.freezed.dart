// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_settings_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserSettingsEntity _$UserSettingsEntityFromJson(Map<String, dynamic> json) {
  return _UserSettingsEntity.fromJson(json);
}

/// @nodoc
mixin _$UserSettingsEntity {
  bool? get isNotificationActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserSettingsEntityCopyWith<UserSettingsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSettingsEntityCopyWith<$Res> {
  factory $UserSettingsEntityCopyWith(
          UserSettingsEntity value, $Res Function(UserSettingsEntity) then) =
      _$UserSettingsEntityCopyWithImpl<$Res, UserSettingsEntity>;
  @useResult
  $Res call({bool? isNotificationActive});
}

/// @nodoc
class _$UserSettingsEntityCopyWithImpl<$Res, $Val extends UserSettingsEntity>
    implements $UserSettingsEntityCopyWith<$Res> {
  _$UserSettingsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isNotificationActive = freezed,
  }) {
    return _then(_value.copyWith(
      isNotificationActive: freezed == isNotificationActive
          ? _value.isNotificationActive
          : isNotificationActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserSettingsEntityImplCopyWith<$Res>
    implements $UserSettingsEntityCopyWith<$Res> {
  factory _$$UserSettingsEntityImplCopyWith(_$UserSettingsEntityImpl value,
          $Res Function(_$UserSettingsEntityImpl) then) =
      __$$UserSettingsEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? isNotificationActive});
}

/// @nodoc
class __$$UserSettingsEntityImplCopyWithImpl<$Res>
    extends _$UserSettingsEntityCopyWithImpl<$Res, _$UserSettingsEntityImpl>
    implements _$$UserSettingsEntityImplCopyWith<$Res> {
  __$$UserSettingsEntityImplCopyWithImpl(_$UserSettingsEntityImpl _value,
      $Res Function(_$UserSettingsEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isNotificationActive = freezed,
  }) {
    return _then(_$UserSettingsEntityImpl(
      isNotificationActive: freezed == isNotificationActive
          ? _value.isNotificationActive
          : isNotificationActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$UserSettingsEntityImpl implements _UserSettingsEntity {
  _$UserSettingsEntityImpl({this.isNotificationActive});

  factory _$UserSettingsEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserSettingsEntityImplFromJson(json);

  @override
  final bool? isNotificationActive;

  @override
  String toString() {
    return 'UserSettingsEntity(isNotificationActive: $isNotificationActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSettingsEntityImpl &&
            (identical(other.isNotificationActive, isNotificationActive) ||
                other.isNotificationActive == isNotificationActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isNotificationActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSettingsEntityImplCopyWith<_$UserSettingsEntityImpl> get copyWith =>
      __$$UserSettingsEntityImplCopyWithImpl<_$UserSettingsEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserSettingsEntityImplToJson(
      this,
    );
  }
}

abstract class _UserSettingsEntity implements UserSettingsEntity {
  factory _UserSettingsEntity({final bool? isNotificationActive}) =
      _$UserSettingsEntityImpl;

  factory _UserSettingsEntity.fromJson(Map<String, dynamic> json) =
      _$UserSettingsEntityImpl.fromJson;

  @override
  bool? get isNotificationActive;
  @override
  @JsonKey(ignore: true)
  _$$UserSettingsEntityImplCopyWith<_$UserSettingsEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
