import 'package:reprocare/common/base/result/base_result.dart';
import 'package:reprocare/features/login/domain/entities/request/login_request_param/login_request_param.dart';
import 'package:reprocare/features/login/domain/entities/response/login_response_entity/login_response_entity.dart';

abstract class IAuthRepository {
  Future<Result<LoginResponseEntity, AppException>> login(
    LoginRequestParam loginRequestParam,
  );

  Future<Result<bool, AppException>> logout();
}
