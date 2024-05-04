// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserSettingsModel _$UserSettingsModelFromJson(Map<String, dynamic> json) {
  return _UserSettingsModel.fromJson(json);
}

/// @nodoc
mixin _$UserSettingsModel {
  String? get id => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;
  int? get pomodoroTime => throw _privateConstructorUsedError;
  int? get shortBreakTime => throw _privateConstructorUsedError;
  int? get longBreakTime => throw _privateConstructorUsedError;
  int? get longBreakPomodoroNumber => throw _privateConstructorUsedError;
  bool? get startPomodoroAutomaticly => throw _privateConstructorUsedError;
  bool? get startBreakAutomaticly => throw _privateConstructorUsedError;
  bool? get noBreak => throw _privateConstructorUsedError;
  bool? get useSystemTimeConfig => throw _privateConstructorUsedError;
  int? get startWeekday => throw _privateConstructorUsedError;
  bool? get pm => throw _privateConstructorUsedError;
  UserModel? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserSettingsModelCopyWith<UserSettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSettingsModelCopyWith<$Res> {
  factory $UserSettingsModelCopyWith(
          UserSettingsModel value, $Res Function(UserSettingsModel) then) =
      _$UserSettingsModelCopyWithImpl<$Res, UserSettingsModel>;
  @useResult
  $Res call(
      {String? id,
      String? language,
      int? pomodoroTime,
      int? shortBreakTime,
      int? longBreakTime,
      int? longBreakPomodoroNumber,
      bool? startPomodoroAutomaticly,
      bool? startBreakAutomaticly,
      bool? noBreak,
      bool? useSystemTimeConfig,
      int? startWeekday,
      bool? pm,
      UserModel? user});

  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$UserSettingsModelCopyWithImpl<$Res, $Val extends UserSettingsModel>
    implements $UserSettingsModelCopyWith<$Res> {
  _$UserSettingsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? language = freezed,
    Object? pomodoroTime = freezed,
    Object? shortBreakTime = freezed,
    Object? longBreakTime = freezed,
    Object? longBreakPomodoroNumber = freezed,
    Object? startPomodoroAutomaticly = freezed,
    Object? startBreakAutomaticly = freezed,
    Object? noBreak = freezed,
    Object? useSystemTimeConfig = freezed,
    Object? startWeekday = freezed,
    Object? pm = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      pomodoroTime: freezed == pomodoroTime
          ? _value.pomodoroTime
          : pomodoroTime // ignore: cast_nullable_to_non_nullable
              as int?,
      shortBreakTime: freezed == shortBreakTime
          ? _value.shortBreakTime
          : shortBreakTime // ignore: cast_nullable_to_non_nullable
              as int?,
      longBreakTime: freezed == longBreakTime
          ? _value.longBreakTime
          : longBreakTime // ignore: cast_nullable_to_non_nullable
              as int?,
      longBreakPomodoroNumber: freezed == longBreakPomodoroNumber
          ? _value.longBreakPomodoroNumber
          : longBreakPomodoroNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      startPomodoroAutomaticly: freezed == startPomodoroAutomaticly
          ? _value.startPomodoroAutomaticly
          : startPomodoroAutomaticly // ignore: cast_nullable_to_non_nullable
              as bool?,
      startBreakAutomaticly: freezed == startBreakAutomaticly
          ? _value.startBreakAutomaticly
          : startBreakAutomaticly // ignore: cast_nullable_to_non_nullable
              as bool?,
      noBreak: freezed == noBreak
          ? _value.noBreak
          : noBreak // ignore: cast_nullable_to_non_nullable
              as bool?,
      useSystemTimeConfig: freezed == useSystemTimeConfig
          ? _value.useSystemTimeConfig
          : useSystemTimeConfig // ignore: cast_nullable_to_non_nullable
              as bool?,
      startWeekday: freezed == startWeekday
          ? _value.startWeekday
          : startWeekday // ignore: cast_nullable_to_non_nullable
              as int?,
      pm: freezed == pm
          ? _value.pm
          : pm // ignore: cast_nullable_to_non_nullable
              as bool?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserSettingsModelImplCopyWith<$Res>
    implements $UserSettingsModelCopyWith<$Res> {
  factory _$$UserSettingsModelImplCopyWith(_$UserSettingsModelImpl value,
          $Res Function(_$UserSettingsModelImpl) then) =
      __$$UserSettingsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? language,
      int? pomodoroTime,
      int? shortBreakTime,
      int? longBreakTime,
      int? longBreakPomodoroNumber,
      bool? startPomodoroAutomaticly,
      bool? startBreakAutomaticly,
      bool? noBreak,
      bool? useSystemTimeConfig,
      int? startWeekday,
      bool? pm,
      UserModel? user});

  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$UserSettingsModelImplCopyWithImpl<$Res>
    extends _$UserSettingsModelCopyWithImpl<$Res, _$UserSettingsModelImpl>
    implements _$$UserSettingsModelImplCopyWith<$Res> {
  __$$UserSettingsModelImplCopyWithImpl(_$UserSettingsModelImpl _value,
      $Res Function(_$UserSettingsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? language = freezed,
    Object? pomodoroTime = freezed,
    Object? shortBreakTime = freezed,
    Object? longBreakTime = freezed,
    Object? longBreakPomodoroNumber = freezed,
    Object? startPomodoroAutomaticly = freezed,
    Object? startBreakAutomaticly = freezed,
    Object? noBreak = freezed,
    Object? useSystemTimeConfig = freezed,
    Object? startWeekday = freezed,
    Object? pm = freezed,
    Object? user = freezed,
  }) {
    return _then(_$UserSettingsModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      pomodoroTime: freezed == pomodoroTime
          ? _value.pomodoroTime
          : pomodoroTime // ignore: cast_nullable_to_non_nullable
              as int?,
      shortBreakTime: freezed == shortBreakTime
          ? _value.shortBreakTime
          : shortBreakTime // ignore: cast_nullable_to_non_nullable
              as int?,
      longBreakTime: freezed == longBreakTime
          ? _value.longBreakTime
          : longBreakTime // ignore: cast_nullable_to_non_nullable
              as int?,
      longBreakPomodoroNumber: freezed == longBreakPomodoroNumber
          ? _value.longBreakPomodoroNumber
          : longBreakPomodoroNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      startPomodoroAutomaticly: freezed == startPomodoroAutomaticly
          ? _value.startPomodoroAutomaticly
          : startPomodoroAutomaticly // ignore: cast_nullable_to_non_nullable
              as bool?,
      startBreakAutomaticly: freezed == startBreakAutomaticly
          ? _value.startBreakAutomaticly
          : startBreakAutomaticly // ignore: cast_nullable_to_non_nullable
              as bool?,
      noBreak: freezed == noBreak
          ? _value.noBreak
          : noBreak // ignore: cast_nullable_to_non_nullable
              as bool?,
      useSystemTimeConfig: freezed == useSystemTimeConfig
          ? _value.useSystemTimeConfig
          : useSystemTimeConfig // ignore: cast_nullable_to_non_nullable
              as bool?,
      startWeekday: freezed == startWeekday
          ? _value.startWeekday
          : startWeekday // ignore: cast_nullable_to_non_nullable
              as int?,
      pm: freezed == pm
          ? _value.pm
          : pm // ignore: cast_nullable_to_non_nullable
              as bool?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$UserSettingsModelImpl implements _UserSettingsModel {
  _$UserSettingsModelImpl(
      {this.id,
      this.language,
      this.pomodoroTime,
      this.shortBreakTime,
      this.longBreakTime,
      this.longBreakPomodoroNumber,
      this.startPomodoroAutomaticly,
      this.startBreakAutomaticly,
      this.noBreak,
      this.useSystemTimeConfig,
      this.startWeekday,
      this.pm,
      this.user});

  factory _$UserSettingsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserSettingsModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? language;
  @override
  final int? pomodoroTime;
  @override
  final int? shortBreakTime;
  @override
  final int? longBreakTime;
  @override
  final int? longBreakPomodoroNumber;
  @override
  final bool? startPomodoroAutomaticly;
  @override
  final bool? startBreakAutomaticly;
  @override
  final bool? noBreak;
  @override
  final bool? useSystemTimeConfig;
  @override
  final int? startWeekday;
  @override
  final bool? pm;
  @override
  final UserModel? user;

  @override
  String toString() {
    return 'UserSettingsModel(id: $id, language: $language, pomodoroTime: $pomodoroTime, shortBreakTime: $shortBreakTime, longBreakTime: $longBreakTime, longBreakPomodoroNumber: $longBreakPomodoroNumber, startPomodoroAutomaticly: $startPomodoroAutomaticly, startBreakAutomaticly: $startBreakAutomaticly, noBreak: $noBreak, useSystemTimeConfig: $useSystemTimeConfig, startWeekday: $startWeekday, pm: $pm, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSettingsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.pomodoroTime, pomodoroTime) ||
                other.pomodoroTime == pomodoroTime) &&
            (identical(other.shortBreakTime, shortBreakTime) ||
                other.shortBreakTime == shortBreakTime) &&
            (identical(other.longBreakTime, longBreakTime) ||
                other.longBreakTime == longBreakTime) &&
            (identical(
                    other.longBreakPomodoroNumber, longBreakPomodoroNumber) ||
                other.longBreakPomodoroNumber == longBreakPomodoroNumber) &&
            (identical(
                    other.startPomodoroAutomaticly, startPomodoroAutomaticly) ||
                other.startPomodoroAutomaticly == startPomodoroAutomaticly) &&
            (identical(other.startBreakAutomaticly, startBreakAutomaticly) ||
                other.startBreakAutomaticly == startBreakAutomaticly) &&
            (identical(other.noBreak, noBreak) || other.noBreak == noBreak) &&
            (identical(other.useSystemTimeConfig, useSystemTimeConfig) ||
                other.useSystemTimeConfig == useSystemTimeConfig) &&
            (identical(other.startWeekday, startWeekday) ||
                other.startWeekday == startWeekday) &&
            (identical(other.pm, pm) || other.pm == pm) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      language,
      pomodoroTime,
      shortBreakTime,
      longBreakTime,
      longBreakPomodoroNumber,
      startPomodoroAutomaticly,
      startBreakAutomaticly,
      noBreak,
      useSystemTimeConfig,
      startWeekday,
      pm,
      user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSettingsModelImplCopyWith<_$UserSettingsModelImpl> get copyWith =>
      __$$UserSettingsModelImplCopyWithImpl<_$UserSettingsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserSettingsModelImplToJson(
      this,
    );
  }
}

abstract class _UserSettingsModel implements UserSettingsModel {
  factory _UserSettingsModel(
      {final String? id,
      final String? language,
      final int? pomodoroTime,
      final int? shortBreakTime,
      final int? longBreakTime,
      final int? longBreakPomodoroNumber,
      final bool? startPomodoroAutomaticly,
      final bool? startBreakAutomaticly,
      final bool? noBreak,
      final bool? useSystemTimeConfig,
      final int? startWeekday,
      final bool? pm,
      final UserModel? user}) = _$UserSettingsModelImpl;

  factory _UserSettingsModel.fromJson(Map<String, dynamic> json) =
      _$UserSettingsModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get language;
  @override
  int? get pomodoroTime;
  @override
  int? get shortBreakTime;
  @override
  int? get longBreakTime;
  @override
  int? get longBreakPomodoroNumber;
  @override
  bool? get startPomodoroAutomaticly;
  @override
  bool? get startBreakAutomaticly;
  @override
  bool? get noBreak;
  @override
  bool? get useSystemTimeConfig;
  @override
  int? get startWeekday;
  @override
  bool? get pm;
  @override
  UserModel? get user;
  @override
  @JsonKey(ignore: true)
  _$$UserSettingsModelImplCopyWith<_$UserSettingsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
