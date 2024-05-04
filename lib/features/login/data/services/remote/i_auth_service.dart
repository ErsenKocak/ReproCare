import 'package:reprocare/common/base/result/base_result.dart';
import 'package:reprocare/features/login/data/models/login_response_model/login_response_model.dart';
import 'package:reprocare/features/login/domain/entities/request/login_request_param/login_request_param.dart';

abstract class IAuthService {
  Future<Result<LoginResponseModel, AppException>> login(
    LoginRequestParam loginRequestParam,
  );

  Future<Result<bool, AppException>> logout();
}
