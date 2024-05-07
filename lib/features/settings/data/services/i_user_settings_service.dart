import 'package:reprocare/common/base/result/base_result.dart';
import 'package:reprocare/features/settings/data/models/user_settings_model/user_settings_model.dart';
import 'package:reprocare/features/settings/domain/entities/request/user_settings_request/user_settings_request.dart';

abstract class IUserSettingsService {
  Future<Result<UserSettingsModel, AppException>> getUserSettings();
  Future<Result<UserSettingsModel, AppException>> updateUserSettings(
      UserSettingsRequest userSettings);
}
