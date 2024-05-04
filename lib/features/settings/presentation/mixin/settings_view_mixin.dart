import 'package:flutter/material.dart';
import 'package:reprocare/common/cubit/theme/theme_cubit.dart';
import 'package:reprocare/common/init/service_locator/service_locator_provider.dart';
import 'package:reprocare/features/login/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:reprocare/features/settings/presentation/views/settings_view.dart';

mixin SettingsViewMixin on State<SettingsView> {
  late ThemeCubit themeCubit;
  late AuthCubit authCubit;

  @override
  void initState() {
    super.initState();

    initalizeMixin();
    initalizeServices();
  }

  Future<void> initalizeMixin() async {
    themeCubit = ServiceLocatorProvider.provide<ThemeCubit>();
    authCubit = ServiceLocatorProvider.provide<AuthCubit>();
  }

  Future<void> initalizeServices() async {}

  Future<void> logout() async {
    await authCubit.logout();
  }
}
