import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reprocare/common/base/cubit/base_cubit.dart';
import 'package:reprocare/common/base/cubit/base_state.dart';
import 'package:reprocare/common/base/result/base_result.dart';
import 'package:reprocare/common/init/service_locator/service_locator_provider.dart';
import 'package:reprocare/features/login/data/services/local/i_auth_local_service.dart';
import 'package:reprocare/features/settings/domain/entities/request/user_settings_request/user_settings_request.dart';
import 'package:reprocare/features/settings/domain/entities/response/user_settings_entity/user_settings_entity.dart';
import 'package:reprocare/features/settings/domain/repositories/i_user_settings_repository.dart';

part 'user_settings_state.dart';
part 'user_settings_cubit.freezed.dart';

class UserSettingsCubit extends Cubit<UserSettingsState>
    with BaseCubit<UserSettingsState> {
  UserSettingsCubit(this._userSettingsRepository, this._loginLocalService)
      : super(UserSettingsState.initial());
  final IUserSettingsRepository _userSettingsRepository;
  final IAuthLocalService _loginLocalService;
  UserSettingsEntity? userSettings;

  @override
  Future<void> initialize() async {
    userSettings = null;
    safeEmit(UserSettingsState.initial());
  }

  void changeUserSettings(UserSettingsEntity settings) {
    userSettings = settings;
    safeEmit(UserSettingsState.success());
  }

  Future<void> getUserSettings() async {
    safeEmit(UserSettingsState.loading());
    final response = await _userSettingsRepository.getUserSettings();

    final value = switch (response) {
      Success(value: final UserSettingsEntity _userSettingsEntityResponse) => {
          userSettings = _userSettingsEntityResponse,
          safeEmit(UserSettingsState.success()),
        },
      Failure(exception: final AppException exception) => {
          safeEmit(UserSettingsState.error(exception.message)),
          showErrorBottomSheet(exceptionMessage: exception.message),
        }
    };
  }

  Future<void> updateUserSettings(
      UserSettingsRequest userSettingsRequest) async {
    safeEmit(UserSettingsState.loading());
    final response =
        await _userSettingsRepository.updateUserSettings(userSettingsRequest);

    final value = switch (response) {
      Success(value: final UserSettingsEntity _userSettingsEntityResponse) => {
          userSettings = _userSettingsEntityResponse,
          safeEmit(UserSettingsState.success()),
        },
      Failure(exception: final AppException exception) => {
          safeEmit(UserSettingsState.error(exception.message)),
          showErrorBottomSheet(exceptionMessage: exception.message),
        }
    };
  }

  emitState() => safeEmit(UserSettingsState.success());
}
