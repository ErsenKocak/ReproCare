// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotificationEntity _$NotificationEntityFromJson(Map<String, dynamic> json) {
  return _NotificationEntity.fromJson(json);
}

/// @nodoc
mixin _$NotificationEntity {
  int? get id => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;
  String? get userSecretID => throw _privateConstructorUsedError;
  String? get messageTitle => throw _privateConstructorUsedError;
  String? get messageBody => throw _privateConstructorUsedError;
  String? get createdDate => throw _privateConstructorUsedError;
  int? get notificationTypeId => throw _privateConstructorUsedError;
  bool? get isSendSuccess => throw _privateConstructorUsedError;
  bool? get isRead => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationEntityCopyWith<NotificationEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationEntityCopyWith<$Res> {
  factory $NotificationEntityCopyWith(
          NotificationEntity value, $Res Function(NotificationEntity) then) =
      _$NotificationEntityCopyWithImpl<$Res, NotificationEntity>;
  @useResult
  $Res call(
      {int? id,
      int? userId,
      String? userSecretID,
      String? messageTitle,
      String? messageBody,
      String? createdDate,
      int? notificationTypeId,
      bool? isSendSuccess,
      bool? isRead});
}

/// @nodoc
class _$NotificationEntityCopyWithImpl<$Res, $Val extends NotificationEntity>
    implements $NotificationEntityCopyWith<$Res> {
  _$NotificationEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? userSecretID = freezed,
    Object? messageTitle = freezed,
    Object? messageBody = freezed,
    Object? createdDate = freezed,
    Object? notificationTypeId = freezed,
    Object? isSendSuccess = freezed,
    Object? isRead = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      userSecretID: freezed == userSecretID
          ? _value.userSecretID
          : userSecretID // ignore: cast_nullable_to_non_nullable
              as String?,
      messageTitle: freezed == messageTitle
          ? _value.messageTitle
          : messageTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      messageBody: freezed == messageBody
          ? _value.messageBody
          : messageBody // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      notificationTypeId: freezed == notificationTypeId
          ? _value.notificationTypeId
          : notificationTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      isSendSuccess: freezed == isSendSuccess
          ? _value.isSendSuccess
          : isSendSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      isRead: freezed == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationEntityImplCopyWith<$Res>
    implements $NotificationEntityCopyWith<$Res> {
  factory _$$NotificationEntityImplCopyWith(_$NotificationEntityImpl value,
          $Res Function(_$NotificationEntityImpl) then) =
      __$$NotificationEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? userId,
      String? userSecretID,
      String? messageTitle,
      String? messageBody,
      String? createdDate,
      int? notificationTypeId,
      bool? isSendSuccess,
      bool? isRead});
}

/// @nodoc
class __$$NotificationEntityImplCopyWithImpl<$Res>
    extends _$NotificationEntityCopyWithImpl<$Res, _$NotificationEntityImpl>
    implements _$$NotificationEntityImplCopyWith<$Res> {
  __$$NotificationEntityImplCopyWithImpl(_$NotificationEntityImpl _value,
      $Res Function(_$NotificationEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? userSecretID = freezed,
    Object? messageTitle = freezed,
    Object? messageBody = freezed,
    Object? createdDate = freezed,
    Object? notificationTypeId = freezed,
    Object? isSendSuccess = freezed,
    Object? isRead = freezed,
  }) {
    return _then(_$NotificationEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      userSecretID: freezed == userSecretID
          ? _value.userSecretID
          : userSecretID // ignore: cast_nullable_to_non_nullable
              as String?,
      messageTitle: freezed == messageTitle
          ? _value.messageTitle
          : messageTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      messageBody: freezed == messageBody
          ? _value.messageBody
          : messageBody // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      notificationTypeId: freezed == notificationTypeId
          ? _value.notificationTypeId
          : notificationTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      isSendSuccess: freezed == isSendSuccess
          ? _value.isSendSuccess
          : isSendSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      isRead: freezed == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationEntityImpl implements _NotificationEntity {
  _$NotificationEntityImpl(
      {this.id,
      this.userId,
      this.userSecretID,
      this.messageTitle,
      this.messageBody,
      this.createdDate,
      this.notificationTypeId,
      this.isSendSuccess,
      this.isRead});

  factory _$NotificationEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationEntityImplFromJson(json);

  @override
  final int? id;
  @override
  final int? userId;
  @override
  final String? userSecretID;
  @override
  final String? messageTitle;
  @override
  final String? messageBody;
  @override
  final String? createdDate;
  @override
  final int? notificationTypeId;
  @override
  final bool? isSendSuccess;
  @override
  final bool? isRead;

  @override
  String toString() {
    return 'NotificationEntity(id: $id, userId: $userId, userSecretID: $userSecretID, messageTitle: $messageTitle, messageBody: $messageBody, createdDate: $createdDate, notificationTypeId: $notificationTypeId, isSendSuccess: $isSendSuccess, isRead: $isRead)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userSecretID, userSecretID) ||
                other.userSecretID == userSecretID) &&
            (identical(other.messageTitle, messageTitle) ||
                other.messageTitle == messageTitle) &&
            (identical(other.messageBody, messageBody) ||
                other.messageBody == messageBody) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.notificationTypeId, notificationTypeId) ||
                other.notificationTypeId == notificationTypeId) &&
            (identical(other.isSendSuccess, isSendSuccess) ||
                other.isSendSuccess == isSendSuccess) &&
            (identical(other.isRead, isRead) || other.isRead == isRead));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      userSecretID,
      messageTitle,
      messageBody,
      createdDate,
      notificationTypeId,
      isSendSuccess,
      isRead);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationEntityImplCopyWith<_$NotificationEntityImpl> get copyWith =>
      __$$NotificationEntityImplCopyWithImpl<_$NotificationEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationEntityImplToJson(
      this,
    );
  }
}

abstract class _NotificationEntity implements NotificationEntity {
  factory _NotificationEntity(
      {final int? id,
      final int? userId,
      final String? userSecretID,
      final String? messageTitle,
      final String? messageBody,
      final String? createdDate,
      final int? notificationTypeId,
      final bool? isSendSuccess,
      final bool? isRead}) = _$NotificationEntityImpl;

  factory _NotificationEntity.fromJson(Map<String, dynamic> json) =
      _$NotificationEntityImpl.fromJson;

  @override
  int? get id;
  @override
  int? get userId;
  @override
  String? get userSecretID;
  @override
  String? get messageTitle;
  @override
  String? get messageBody;
  @override
  String? get createdDate;
  @override
  int? get notificationTypeId;
  @override
  bool? get isSendSuccess;
  @override
  bool? get isRead;
  @override
  @JsonKey(ignore: true)
  _$$NotificationEntityImplCopyWith<_$NotificationEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
