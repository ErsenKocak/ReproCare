import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reprocare/common/base/cubit/base_cubit.dart';
import 'package:reprocare/common/base/cubit/base_state.dart';
import 'package:reprocare/common/base/result/base_result.dart';
import 'package:reprocare/common/router/app_router.dart';
import 'package:reprocare/common/router/app_routes.dart';
import 'package:reprocare/core/constants/cache/cache_constants.dart';
import 'package:reprocare/features/login/data/services/local/i_auth_local_service.dart';
import 'package:reprocare/features/login/domain/entities/request/login_request_param/login_request_param.dart';

import 'package:reprocare/features/login/domain/repositories/login_repository/i_auth_repository.dart';
import 'package:reprocare/features/settings/domain/entities/response/user_settings_entity/user_entity.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

final class AuthCubit extends Cubit<AuthState> with BaseCubit<AuthState> {
  AuthCubit(this._loginRepository, this._loginLocalService)
      : super(AuthState.initial());

  final IAuthRepository _loginRepository;
  final IAuthLocalService _loginLocalService;
  late UserEntity loginResponseEntity;
  @override
  Future<void> initialize() async {
    safeEmit(AuthState.initial());
  }

  Future<void> login(LoginRequestParam loginRequestParam) async {
    safeEmit(AuthState.loading());

    final response = await _loginRepository.login(loginRequestParam);

    final value = switch (response) {
      Success(value: final UserEntity entity) => {
          loginResponseEntity = entity,
          safeEmit(AuthState.success(loginResponseEntity)),
          AppRouter.goNamed(AppRoutes.Notification.path),
          _loginLocalService.put(
            CacheConstants.User.name,
            loginResponseEntity,
          ),
        },
      Failure(exception: final AppException exception) => {
          safeEmit(AuthState.error(exception.message)),
          showErrorBottomSheet(exceptionMessage: exception.message),
        }
    };
  }

  Future<void> logout() async {
    safeEmit(AuthState.loading());

    final response = await _loginRepository.logout();

    final value = switch (response) {
      Success(value: final bool isLogout) => {
          if (isLogout)
            {
              _loginLocalService.delete(CacheConstants.User.name),
              AppRouter.goNamed(AppRoutes.Login.path),
            }
        },
      Failure(exception: final AppException exception) => {
          showErrorBottomSheet(exceptionMessage: exception.message),
        }
    };
  }
}
