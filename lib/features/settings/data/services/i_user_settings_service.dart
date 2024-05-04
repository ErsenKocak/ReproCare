import 'package:reprocare/common/base/result/base_result.dart';
import 'package:reprocare/features/settings/data/models/user_settings_model/user_settings_model.dart';

abstract class IUserSettingsService {
  Future<Result<UserSettingsModel, AppException>> getUserSettings();
}
