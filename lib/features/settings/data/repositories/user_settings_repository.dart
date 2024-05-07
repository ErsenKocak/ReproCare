import 'package:reprocare/common/base/result/base_result.dart';
import 'package:reprocare/features/settings/data/models/user_settings_model/user_settings_model.dart';
import 'package:reprocare/features/settings/data/services/i_user_settings_service.dart';
import 'package:reprocare/features/settings/domain/entities/request/user_settings_request/user_settings_request.dart';
import 'package:reprocare/features/settings/domain/entities/response/user_settings_entity/user_settings_entity.dart';
import 'package:reprocare/features/settings/domain/repositories/i_user_settings_repository.dart';

final class UserSettingsRepository implements IUserSettingsRepository {
  final IUserSettingsService _userSettingsService;

  UserSettingsRepository(this._userSettingsService);

  @override
  Future<Result<UserSettingsEntity, AppException>> getUserSettings() async {
    final response = await _userSettingsService.getUserSettings();

    return switch (response) {
      Success(value: final UserSettingsModel _userModel) =>
        Success(UserSettingsEntity.fromJson(_userModel.toJson())),
      Failure(exception: final AppException exception) => Failure(exception),
    };
  }

  @override
  Future<Result<UserSettingsEntity, AppException>> updateUserSettings(
      UserSettingsRequest userSettings) async {
    final response =
        await _userSettingsService.updateUserSettings(userSettings);

    return switch (response) {
      Success(value: final UserSettingsModel _userModel) =>
        Success(UserSettingsEntity.fromJson(_userModel.toJson())),
      Failure(exception: final AppException exception) => Failure(exception),
    };
  }
}
