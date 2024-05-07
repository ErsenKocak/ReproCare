import 'package:reprocare/common/base/result/base_result.dart';
import 'package:reprocare/features/settings/domain/entities/request/user_settings_request/user_settings_request.dart';
import 'package:reprocare/features/settings/domain/entities/response/user_settings_entity/user_settings_entity.dart';

abstract class IUserSettingsRepository {
  Future<Result<UserSettingsEntity, AppException>> getUserSettings();
  Future<Result<UserSettingsEntity, AppException>> updateUserSettings(
      UserSettingsRequest userSettings);
}
