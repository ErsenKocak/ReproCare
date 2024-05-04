import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    String? id,
    String? email,
    String? name,
    String? surname,
    dynamic birthday,
    String? role,
    String? photoPath,
    String? photoUrl,
    bool? premium,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
