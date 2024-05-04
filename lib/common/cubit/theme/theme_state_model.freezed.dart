// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ThemeStateModel _$ThemeStateModelFromJson(Map<String, dynamic> json) {
  return _ThemeStateModel.fromJson(json);
}

/// @nodoc
mixin _$ThemeStateModel {
  ThemeModeEnum get themeMode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ThemeStateModelCopyWith<ThemeStateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeStateModelCopyWith<$Res> {
  factory $ThemeStateModelCopyWith(
          ThemeStateModel value, $Res Function(ThemeStateModel) then) =
      _$ThemeStateModelCopyWithImpl<$Res, ThemeStateModel>;
  @useResult
  $Res call({ThemeModeEnum themeMode});
}

/// @nodoc
class _$ThemeStateModelCopyWithImpl<$Res, $Val extends ThemeStateModel>
    implements $ThemeStateModelCopyWith<$Res> {
  _$ThemeStateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
  }) {
    return _then(_value.copyWith(
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeModeEnum,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ThemeStateModelImplCopyWith<$Res>
    implements $ThemeStateModelCopyWith<$Res> {
  factory _$$ThemeStateModelImplCopyWith(_$ThemeStateModelImpl value,
          $Res Function(_$ThemeStateModelImpl) then) =
      __$$ThemeStateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ThemeModeEnum themeMode});
}

/// @nodoc
class __$$ThemeStateModelImplCopyWithImpl<$Res>
    extends _$ThemeStateModelCopyWithImpl<$Res, _$ThemeStateModelImpl>
    implements _$$ThemeStateModelImplCopyWith<$Res> {
  __$$ThemeStateModelImplCopyWithImpl(
      _$ThemeStateModelImpl _value, $Res Function(_$ThemeStateModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
  }) {
    return _then(_$ThemeStateModelImpl(
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeModeEnum,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ThemeStateModelImpl implements _ThemeStateModel {
  _$ThemeStateModelImpl({this.themeMode = ThemeModeEnum.System});

  factory _$ThemeStateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ThemeStateModelImplFromJson(json);

  @override
  @JsonKey()
  final ThemeModeEnum themeMode;

  @override
  String toString() {
    return 'ThemeStateModel(themeMode: $themeMode)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThemeStateModelImplCopyWith<_$ThemeStateModelImpl> get copyWith =>
      __$$ThemeStateModelImplCopyWithImpl<_$ThemeStateModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ThemeStateModelImplToJson(
      this,
    );
  }
}

abstract class _ThemeStateModel implements ThemeStateModel {
  factory _ThemeStateModel({final ThemeModeEnum themeMode}) =
      _$ThemeStateModelImpl;

  factory _ThemeStateModel.fromJson(Map<String, dynamic> json) =
      _$ThemeStateModelImpl.fromJson;

  @override
  ThemeModeEnum get themeMode;
  @override
  @JsonKey(ignore: true)
  _$$ThemeStateModelImplCopyWith<_$ThemeStateModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
