import 'package:reprocare/common/base/result/base_result.dart';
import 'package:reprocare/features/login/domain/entities/request/login_request_param/login_request_param.dart';

import 'package:reprocare/features/settings/domain/entities/response/user_settings_entity/user_entity.dart';

abstract class IAuthRepository {
  Future<Result<UserEntity, AppException>> login(
    LoginRequestParam loginRequestParam,
  );

  Future<Result<bool, AppException>> logout();
}
