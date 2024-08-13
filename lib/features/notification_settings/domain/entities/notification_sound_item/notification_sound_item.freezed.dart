// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_sound_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotificationSoundItem _$NotificationSoundItemFromJson(
    Map<String, dynamic> json) {
  return _NotificationSoundItem.fromJson(json);
}

/// @nodoc
mixin _$NotificationSoundItem {
  String get name => throw _privateConstructorUsedError;
  String get fileName => throw _privateConstructorUsedError;
  String get assetPath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationSoundItemCopyWith<NotificationSoundItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationSoundItemCopyWith<$Res> {
  factory $NotificationSoundItemCopyWith(NotificationSoundItem value,
          $Res Function(NotificationSoundItem) then) =
      _$NotificationSoundItemCopyWithImpl<$Res, NotificationSoundItem>;
  @useResult
  $Res call({String name, String fileName, String assetPath});
}

/// @nodoc
class _$NotificationSoundItemCopyWithImpl<$Res,
        $Val extends NotificationSoundItem>
    implements $NotificationSoundItemCopyWith<$Res> {
  _$NotificationSoundItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? fileName = null,
    Object? assetPath = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      assetPath: null == assetPath
          ? _value.assetPath
          : assetPath // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationSoundItemImplCopyWith<$Res>
    implements $NotificationSoundItemCopyWith<$Res> {
  factory _$$NotificationSoundItemImplCopyWith(
          _$NotificationSoundItemImpl value,
          $Res Function(_$NotificationSoundItemImpl) then) =
      __$$NotificationSoundItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String fileName, String assetPath});
}

/// @nodoc
class __$$NotificationSoundItemImplCopyWithImpl<$Res>
    extends _$NotificationSoundItemCopyWithImpl<$Res,
        _$NotificationSoundItemImpl>
    implements _$$NotificationSoundItemImplCopyWith<$Res> {
  __$$NotificationSoundItemImplCopyWithImpl(_$NotificationSoundItemImpl _value,
      $Res Function(_$NotificationSoundItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? fileName = null,
    Object? assetPath = null,
  }) {
    return _then(_$NotificationSoundItemImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      assetPath: null == assetPath
          ? _value.assetPath
          : assetPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationSoundItemImpl implements _NotificationSoundItem {
  _$NotificationSoundItemImpl(
      {required this.name, required this.fileName, required this.assetPath});

  factory _$NotificationSoundItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationSoundItemImplFromJson(json);

  @override
  final String name;
  @override
  final String fileName;
  @override
  final String assetPath;

  @override
  String toString() {
    return 'NotificationSoundItem(name: $name, fileName: $fileName, assetPath: $assetPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationSoundItemImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.assetPath, assetPath) ||
                other.assetPath == assetPath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, fileName, assetPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationSoundItemImplCopyWith<_$NotificationSoundItemImpl>
      get copyWith => __$$NotificationSoundItemImplCopyWithImpl<
          _$NotificationSoundItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationSoundItemImplToJson(
      this,
    );
  }
}

abstract class _NotificationSoundItem implements NotificationSoundItem {
  factory _NotificationSoundItem(
      {required final String name,
      required final String fileName,
      required final String assetPath}) = _$NotificationSoundItemImpl;

  factory _NotificationSoundItem.fromJson(Map<String, dynamic> json) =
      _$NotificationSoundItemImpl.fromJson;

  @override
  String get name;
  @override
  String get fileName;
  @override
  String get assetPath;
  @override
  @JsonKey(ignore: true)
  _$$NotificationSoundItemImplCopyWith<_$NotificationSoundItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}
