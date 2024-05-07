import 'package:reprocare/common/base/result/base_result.dart';
import 'package:reprocare/features/login/data/models/user_model/user_model.dart';
import 'package:reprocare/features/login/data/services/remote/i_auth_service.dart';
import 'package:reprocare/features/login/domain/entities/request/login_request_param/login_request_param.dart';
import 'package:reprocare/features/login/domain/repositories/login_repository/i_auth_repository.dart';
import 'package:reprocare/features/settings/domain/entities/response/user_settings_entity/user_entity.dart';

final class AuthRepository implements IAuthRepository {
  final IAuthService _authService;

  AuthRepository(
    this._authService,
  );

  @override
  Future<Result<UserEntity, AppException>> login(
    LoginRequestParam loginRequestParam,
  ) async {
    final response = await _authService.login(loginRequestParam);

    return switch (response) {
      Success(value: final UserModel loginResponseModel) =>
        Success(UserEntity.fromJson(loginResponseModel.toJson())),
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
