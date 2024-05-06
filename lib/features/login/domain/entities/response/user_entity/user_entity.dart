import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed
class UserEntity with _$UserEntity {
  factory UserEntity({
    int? institutionId,
    String? name,
    String? surname,
    String? phoneNumber,
    String? password,
    String? token,
    String? refreshToken,
    String? tokenExpireDate,
    String? tokenCreatedDate,
    String? createdDate,
    @JsonKey(name: 'userSecretID') String? userSecretId,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}
