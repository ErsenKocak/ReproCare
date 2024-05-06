import 'package:reprocare/common/base/result/base_result.dart';
import 'package:reprocare/common/network/http_client/http_client_api_url/http_client_end_points.dart';
import 'package:reprocare/common/network/http_client/manager/network_client.dart';
import 'package:reprocare/core/constants/network/http_call_type/http_call_type.dart';
import 'package:reprocare/features/login/data/models/user_model/user_model.dart';

import 'package:reprocare/features/login/data/services/remote/i_auth_service.dart';
import 'package:reprocare/features/login/domain/entities/request/login_request_param/login_request_param.dart';

final class AuthService implements IAuthService {
  final NetworkClient _networkClient;

  AuthService(this._networkClient);

  @override
  Future<Result<UserModel, AppException>> login(
    LoginRequestParam loginRequestParam,
  ) async {
    return await _networkClient(
      data: loginRequestParam.toJson(),
      path: HttpClientEndPoints.Login.URL,
      callType: HttpCallType.POST,
      mapper: (json) => UserModel.fromJson(json),
    );
  }

  @override
  Future<Result<bool, AppException>> logout() async {
    return await _networkClient.call(
      path: HttpClientEndPoints.Logout.URL,
      callType: HttpCallType.POST,
      withOutResponse: true,
      mapper: (json) => true,
    );
  }
}
