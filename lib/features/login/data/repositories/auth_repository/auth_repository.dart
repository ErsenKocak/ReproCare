import 'package:reprocare/common/base/result/base_result.dart';
import 'package:reprocare/core/constants/cache/cache_constants.dart';
import 'package:reprocare/features/login/data/models/login_response_model/login_response_model.dart';
import 'package:reprocare/features/login/data/services/local/i_auth_local_service.dart';
import 'package:reprocare/features/login/data/services/remote/i_auth_service.dart';
import 'package:reprocare/features/login/domain/entities/request/login_request_param/login_request_param.dart';
import 'package:reprocare/features/login/domain/entities/response/login_response_entity/login_response_entity.dart';
import 'package:reprocare/features/login/domain/repositories/login_repository/i_auth_repository.dart';

final class AuthRepository implements IAuthRepository {
  final IAuthService _authService;

  AuthRepository(
    this._authService,
  );

  @override
  Future<Result<LoginResponseEntity, AppException>> login(
    LoginRequestParam loginRequestParam,
  ) async {
    final response = await _authService.login(loginRequestParam);

    return switch (response) {
      Success(value: final LoginResponseModel loginResponseModel) =>
        Success(LoginResponseEntity.fromJson(loginResponseModel.toJson())),
      Failure(exception: final AppException exception) => Failure(exception)
    };
  }

  @override
  Future<Result<bool, AppException>> logout() async {
    final response = await _authService.logout();

    final Result<bool, AppException> value = switch (response) {
      Success(value: final bool _result) => Success(true),
      Failure(exception: final AppException exception) => Failure(exception),
    };

    return value;
  }
}
