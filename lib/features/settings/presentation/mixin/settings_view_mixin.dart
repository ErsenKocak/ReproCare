import 'package:flutter/material.dart';
import 'package:reprocare/common/cubit/language/language_cubit.dart';
import 'package:reprocare/common/cubit/theme/theme_cubit.dart';
import 'package:reprocare/common/init/service_locator/service_locator_provider.dart';
import 'package:reprocare/common/router/app_router.dart';
import 'package:reprocare/features/login/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:reprocare/features/settings/domain/entities/request/user_settings_request/user_settings_request.dart';
import 'package:reprocare/features/settings/domain/entities/response/user_settings_entity/user_settings_entity.dart';
import 'package:reprocare/features/settings/presentation/cubit/user_settings_cubit.dart';
import 'package:reprocare/features/settings/presentation/views/settings_view.dart';

mixin SettingsViewMixin on State<SettingsView> {
  late ThemeCubit themeCubit;
  late LanguageCubit languageCubit;
  late AuthCubit authCubit;
  late UserSettingsCubit userSettingsCubit;

  @override
  void initState() {
    super.initState();

    initalizeMixin();
    initalizeServices();
  }

  Future<void> initalizeMixin() async {
    themeCubit = ServiceLocatorProvider.provide<ThemeCubit>();
    languageCubit = ServiceLocatorProvider.provide<LanguageCubit>();
    authCubit = ServiceLocatorProvider.provide<AuthCubit>();
    userSettingsCubit = ServiceLocatorProvider.provide<UserSettingsCubit>();
  }

  Future<void> initalizeServices() async {
    await userSettingsCubit.getUserSettings();
  }

  void changeUserSettings(UserSettingsEntity settings) {
    AppRouter.pop();
    userSettingsCubit.changeUserSettings(settings);
    updateUserSettings(UserSettingsRequest(
        isNotificationActive: settings.isNotificationActive));
  }

  Future<void> updateUserSettings(
      UserSettingsRequest userSettingsRequest) async {
    await userSettingsCubit.updateUserSettings(userSettingsRequest);
  }

  Future<void> logout() async {
    await authCubit.logout();
  }
}
