import 'package:reprocare/common/base/result/base_result.dart';
import 'package:reprocare/common/network/http_client/http_client_api_url/http_client_end_points.dart';
import 'package:reprocare/common/network/http_client/manager/network_client.dart';
import 'package:reprocare/core/constants/network/http_call_type/http_call_type.dart';
import 'package:reprocare/features/settings/data/models/user_settings_model/user_settings_model.dart';
import 'package:reprocare/features/settings/data/services/i_user_settings_service.dart';
import 'package:reprocare/features/settings/domain/entities/request/user_settings_request/user_settings_request.dart';

final class UserSettingsService implements IUserSettingsService {
  final NetworkClient _networkClient;

  UserSettingsService(this._networkClient);

  @override
  Future<Result<UserSettingsModel, AppException>> getUserSettings() async {
    return await _networkClient.call(
      path: HttpClientEndPoints.GetUserSettings.URL,
      callType: HttpCallType.GET,
      mapper: (json) => UserSettingsModel.fromJson(json),
    );
  }

  @override
  Future<Result<UserSettingsModel, AppException>> updateUserSettings(
      UserSettingsRequest userSettings) async {
    return await _networkClient.call(
      path: HttpClientEndPoints.UpdateUserSettings.URL,
      callType: HttpCallType.PUT,
      data: userSettings,
      mapper: (json) => UserSettingsModel.fromJson(json),
    );
  }
}
