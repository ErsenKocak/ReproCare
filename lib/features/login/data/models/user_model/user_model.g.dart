// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      institutionId: (json['institutionId'] as num?)?.toInt(),
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      password: json['password'] as String?,
      token: json['token'] as String?,
      refreshToken: json['refreshToken'] as String?,
      tokenExpireDate: json['tokenExpireDate'] as String?,
      tokenCreatedDate: json['tokenCreatedDate'] as String?,
      createdDate: json['createdDate'] as String?,
      userSecretId: json['userSecretID'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'institutionId': instance.institutionId,
      'name': instance.name,
      'surname': instance.surname,
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      'tokenExpireDate': instance.tokenExpireDate,
      'tokenCreatedDate': instance.tokenCreatedDate,
      'createdDate': instance.createdDate,
      'userSecretID': instance.userSecretId,
    };
