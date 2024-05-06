import 'package:reprocare/common/base/result/base_result.dart';
import 'package:reprocare/features/login/data/models/user_model/user_model.dart';
import 'package:reprocare/features/login/domain/entities/request/login_request_param/login_request_param.dart';

abstract class IAuthService {
  Future<Result<UserModel, AppException>> login(
    LoginRequestParam loginRequestParam,
  );

  Future<Result<bool, AppException>> logout();
}
