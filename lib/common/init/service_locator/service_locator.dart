import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:reprocare/common/cubit/language/language_cubit.dart';
import 'package:reprocare/common/cubit/theme/data/services/i_theme_local_service.dart';
import 'package:reprocare/common/cubit/theme/data/services/theme_local_service.dart';
import 'package:reprocare/common/cubit/theme/theme_cubit.dart';
import 'package:reprocare/common/logger/app_logger.dart';
import 'package:reprocare/common/network/http_client/manager/network_client.dart';
import 'package:reprocare/core/constants/application/application.dart';
import 'package:reprocare/features/login/data/repositories/auth_repository/auth_repository.dart';
import 'package:reprocare/features/login/data/services/local/auth_local_service.dart';
import 'package:reprocare/features/login/data/services/local/i_auth_local_service.dart';
import 'package:reprocare/features/login/data/services/remote/auth_service.dart';
import 'package:reprocare/features/login/data/services/remote/i_auth_service.dart';
import 'package:reprocare/features/login/domain/repositories/login_repository/i_auth_repository.dart';
import 'package:reprocare/features/login/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:reprocare/features/notification/data/repositories/notification_repository.dart';
import 'package:reprocare/features/notification/data/services/i_notification_service.dart';
import 'package:reprocare/features/notification/data/services/notification_service.dart';
import 'package:reprocare/features/notification/domain/repositories/i_notification_repository.dart';
import 'package:reprocare/features/notification/presentation/cubit/notification_cubit.dart';
import 'package:reprocare/features/settings/data/repositories/user_settings_repository.dart';
import 'package:reprocare/features/settings/data/services/i_user_settings_service.dart';
import 'package:reprocare/features/settings/data/services/user_settings_service.dart';
import 'package:reprocare/features/settings/domain/repositories/i_user_settings_repository.dart';
import 'package:reprocare/features/settings/presentation/cubit/user_settings_cubit.dart';
import 'package:reprocare/helper/device/device_info/device_info_helper.dart';
import 'package:reprocare/helper/network/internet_connection_check/internet_connection_check_helper.dart';

final _serviceLocator = GetIt.instance;

Future<void> initalize() async {
  // #Network
  _serviceLocator.registerLazySingleton<InternetConnectionCheckHelper>(
    () => InternetConnectionCheckHelper(),
  );

  _serviceLocator.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        baseUrl: Application.apiBaseUrl,
        contentType: 'application/json',
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(minutes: 2),
        receiveTimeout: const Duration(minutes: 2),
      ),
    ),
  );

  await _serviceLocator
    ..registerLazySingleton(
      () => NetworkClient(
        dio: _serviceLocator<Dio>(),
        connectionCheckHelper: _serviceLocator<InternetConnectionCheckHelper>(),
      ),
    )

    // #Device Info
    ..registerLazySingleton(() => DeviceInfoHelper())

    // #Theme
    ..registerLazySingleton<IThemeLocalService>(() => ThemeLocalService())
    ..registerLazySingleton<ThemeCubit>(
      () => ThemeCubit(_serviceLocator<IThemeLocalService>()),
    )
    ..registerLazySingleton<LanguageCubit>(
      () => LanguageCubit(),
    )

    // #Login
    ..registerLazySingleton<IAuthService>(
      () => AuthService(_serviceLocator<NetworkClient>()),
    )
    ..registerLazySingleton<IAuthLocalService>(() => AuthLocalService())
    ..registerLazySingleton<IAuthRepository>(
      () => AuthRepository(
        _serviceLocator<IAuthService>(),
      ),
    )
    ..registerLazySingleton<AuthCubit>(() => AuthCubit(
          _serviceLocator<IAuthRepository>(),
          _serviceLocator<IAuthLocalService>(),
        ))
    //# Notification
    ..registerLazySingleton<INotificationService>(
      () => NotificationService(_serviceLocator<NetworkClient>()),
    )
    ..registerLazySingleton<INotificationRepository>(
      () => NotificationRepository(
        _serviceLocator<INotificationService>(),
      ),
    )
    ..registerLazySingleton<NotificationCubit>(() => NotificationCubit(
          _serviceLocator<INotificationRepository>(),
        ))

    //#User Settings
    ..registerLazySingleton<IUserSettingsService>(
        () => UserSettingsService(_serviceLocator<NetworkClient>()))
    ..registerLazySingleton<IUserSettingsRepository>(
      () => UserSettingsRepository(
        _serviceLocator<IUserSettingsService>(),
      ),
    )
    ..registerLazySingleton<UserSettingsCubit>(() => UserSettingsCubit(
        _serviceLocator<IUserSettingsRepository>(),
        _serviceLocator<IAuthLocalService>()));

  await _initializeOtherDependencies();

  AppLogger.call(title: 'Service Locator Initialized');
}

Future<void> _initializeOtherDependencies() async {
  await provide<IAuthLocalService>().initialize();
  await provide<IThemeLocalService>().initialize();
  await provide<ThemeCubit>().initialize();
}

T provide<T extends Object>() {
  return _serviceLocator<T>();
}
