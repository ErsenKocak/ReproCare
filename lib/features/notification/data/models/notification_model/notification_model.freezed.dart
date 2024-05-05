// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) {
  return _NotificationModel.fromJson(json);
}

/// @nodoc
mixin _$NotificationModel {
  String? get id => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get messageTitle => throw _privateConstructorUsedError;
  String? get messageBody => throw _privateConstructorUsedError;
  String? get createdDate => throw _privateConstructorUsedError;
  int? get notificationTypeId => throw _privateConstructorUsedError;
  bool? get isSendSuccess => throw _privateConstructorUsedError;
  bool? get isRead => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationModelCopyWith<NotificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationModelCopyWith<$Res> {
  factory $NotificationModelCopyWith(
          NotificationModel value, $Res Function(NotificationModel) then) =
      _$NotificationModelCopyWithImpl<$Res, NotificationModel>;
  @useResult
  $Res call(
      {String? id,
      String? userId,
      String? messageTitle,
      String? messageBody,
      String? createdDate,
      int? notificationTypeId,
      bool? isSendSuccess,
      bool? isRead});
}

/// @nodoc
class _$NotificationModelCopyWithImpl<$Res, $Val extends NotificationModel>
    implements $NotificationModelCopyWith<$Res> {
  _$NotificationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
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
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
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
abstract class _$$NotificationModelImplCopyWith<$Res>
    implements $NotificationModelCopyWith<$Res> {
  factory _$$NotificationModelImplCopyWith(_$NotificationModelImpl value,
          $Res Function(_$NotificationModelImpl) then) =
      __$$NotificationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? userId,
      String? messageTitle,
      String? messageBody,
      String? createdDate,
      int? notificationTypeId,
      bool? isSendSuccess,
      bool? isRead});
}

/// @nodoc
class __$$NotificationModelImplCopyWithImpl<$Res>
    extends _$NotificationModelCopyWithImpl<$Res, _$NotificationModelImpl>
    implements _$$NotificationModelImplCopyWith<$Res> {
  __$$NotificationModelImplCopyWithImpl(_$NotificationModelImpl _value,
      $Res Function(_$NotificationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? messageTitle = freezed,
    Object? messageBody = freezed,
    Object? createdDate = freezed,
    Object? notificationTypeId = freezed,
    Object? isSendSuccess = freezed,
    Object? isRead = freezed,
  }) {
    return _then(_$NotificationModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
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
class _$NotificationModelImpl implements _NotificationModel {
  _$NotificationModelImpl(
      {this.id,
      this.userId,
      this.messageTitle,
      this.messageBody,
      this.createdDate,
      this.notificationTypeId,
      this.isSendSuccess,
      this.isRead});

  factory _$NotificationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? userId;
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
    return 'NotificationModel(id: $id, userId: $userId, messageTitle: $messageTitle, messageBody: $messageBody, createdDate: $createdDate, notificationTypeId: $notificationTypeId, isSendSuccess: $isSendSuccess, isRead: $isRead)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
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
  int get hashCode => Object.hash(runtimeType, id, userId, messageTitle,
      messageBody, createdDate, notificationTypeId, isSendSuccess, isRead);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationModelImplCopyWith<_$NotificationModelImpl> get copyWith =>
      __$$NotificationModelImplCopyWithImpl<_$NotificationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationModelImplToJson(
      this,
    );
  }
}

abstract class _NotificationModel implements NotificationModel {
  factory _NotificationModel(
      {final String? id,
      final String? userId,
      final String? messageTitle,
      final String? messageBody,
      final String? createdDate,
      final int? notificationTypeId,
      final bool? isSendSuccess,
      final bool? isRead}) = _$NotificationModelImpl;

  factory _NotificationModel.fromJson(Map<String, dynamic> json) =
      _$NotificationModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get userId;
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
  _$$NotificationModelImplCopyWith<_$NotificationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
