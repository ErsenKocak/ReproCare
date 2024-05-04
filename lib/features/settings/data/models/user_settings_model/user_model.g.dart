// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      birthday: json['birthday'],
      role: json['role'] as String?,
      photoPath: json['photoPath'] as String?,
      photoUrl: json['photoUrl'] as String?,
      premium: json['premium'] as bool?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'surname': instance.surname,
      'birthday': instance.birthday,
      'role': instance.role,
      'photoPath': instance.photoPath,
      'photoUrl': instance.photoUrl,
      'premium': instance.premium,
    };
