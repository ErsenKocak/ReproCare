import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:reprocare/common/cubit/theme/theme_cubit.dart';
import 'package:reprocare/common/init/service_locator/service_locator_provider.dart';
import 'package:reprocare/features/login/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:reprocare/features/settings/presentation/cubit/user_settings_cubit.dart';

class AppBlocProvider {
  static List<SingleChildWidget> _appBlocs = [
    //  BlocProvider(
    //   create: (context) => FocusSoundsViewCubit(),
    // ),

    BlocProvider.value(
      value: ServiceLocatorProvider.provide<ThemeCubit>(),
    ),
    BlocProvider.value(
      value: ServiceLocatorProvider.provide<AuthCubit>(),
    ),
    BlocProvider.value(
      value: ServiceLocatorProvider.provide<UserSettingsCubit>(),
    ),
  ];

  static List<SingleChildWidget> getMainBlocProviderList() => _appBlocs;
}
