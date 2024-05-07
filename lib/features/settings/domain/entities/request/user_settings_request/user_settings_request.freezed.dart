// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_settings_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserSettingsRequest _$UserSettingsRequestFromJson(Map<String, dynamic> json) {
  return _UserSettingsRequest.fromJson(json);
}

/// @nodoc
mixin _$UserSettingsRequest {
  bool? get isNotificationActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserSettingsRequestCopyWith<UserSettingsRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSettingsRequestCopyWith<$Res> {
  factory $UserSettingsRequestCopyWith(
          UserSettingsRequest value, $Res Function(UserSettingsRequest) then) =
      _$UserSettingsRequestCopyWithImpl<$Res, UserSettingsRequest>;
  @useResult
  $Res call({bool? isNotificationActive});
}

/// @nodoc
class _$UserSettingsRequestCopyWithImpl<$Res, $Val extends UserSettingsRequest>
    implements $UserSettingsRequestCopyWith<$Res> {
  _$UserSettingsRequestCopyWithImpl(this._value, this._then);

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
abstract class _$$UserSettingsRequestImplCopyWith<$Res>
    implements $UserSettingsRequestCopyWith<$Res> {
  factory _$$UserSettingsRequestImplCopyWith(_$UserSettingsRequestImpl value,
          $Res Function(_$UserSettingsRequestImpl) then) =
      __$$UserSettingsRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? isNotificationActive});
}

/// @nodoc
class __$$UserSettingsRequestImplCopyWithImpl<$Res>
    extends _$UserSettingsRequestCopyWithImpl<$Res, _$UserSettingsRequestImpl>
    implements _$$UserSettingsRequestImplCopyWith<$Res> {
  __$$UserSettingsRequestImplCopyWithImpl(_$UserSettingsRequestImpl _value,
      $Res Function(_$UserSettingsRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isNotificationActive = freezed,
  }) {
    return _then(_$UserSettingsRequestImpl(
      isNotificationActive: freezed == isNotificationActive
          ? _value.isNotificationActive
          : isNotificationActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserSettingsRequestImpl implements _UserSettingsRequest {
  _$UserSettingsRequestImpl({this.isNotificationActive});

  factory _$UserSettingsRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserSettingsRequestImplFromJson(json);

  @override
  final bool? isNotificationActive;

  @override
  String toString() {
    return 'UserSettingsRequest(isNotificationActive: $isNotificationActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSettingsRequestImpl &&
            (identical(other.isNotificationActive, isNotificationActive) ||
                other.isNotificationActive == isNotificationActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isNotificationActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSettingsRequestImplCopyWith<_$UserSettingsRequestImpl> get copyWith =>
      __$$UserSettingsRequestImplCopyWithImpl<_$UserSettingsRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserSettingsRequestImplToJson(
      this,
    );
  }
}

abstract class _UserSettingsRequest implements UserSettingsRequest {
  factory _UserSettingsRequest({final bool? isNotificationActive}) =
      _$UserSettingsRequestImpl;

  factory _UserSettingsRequest.fromJson(Map<String, dynamic> json) =
      _$UserSettingsRequestImpl.fromJson;

  @override
  bool? get isNotificationActive;
  @override
  @JsonKey(ignore: true)
  _$$UserSettingsRequestImplCopyWith<_$UserSettingsRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
