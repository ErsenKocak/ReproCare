import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
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
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
