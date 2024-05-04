import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reprocare/common/cubit/theme/theme_cubit.dart';
import 'package:reprocare/common/cubit/theme/theme_state_model.dart';
import 'package:reprocare/common/functions/initializer/app_initializer.dart';
import 'package:reprocare/common/init/bloc_provider/app_bloc_provider.dart';
import 'package:reprocare/common/init/service_locator/service_locator_provider.dart';
import 'package:reprocare/common/router/app_router.dart';
import 'package:reprocare/core/constants/application/application.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';
import 'package:reprocare/helper/localization/localization_helper.dart';

Future<void> main() async {
  await AppInitializer.initialize();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(
    EasyLocalization(
      supportedLocales: AppLocalizationHelper.localList,
      path: AppLocalizationHelper.path,
      fallbackLocale: AppLocalizationHelper.currentLocale,
      startLocale: AppLocalizationHelper.currentLocale,
      child: const ReproCareApp(),
    ),
  );
}

class ReproCareApp extends StatelessWidget {
  const ReproCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return MultiBlocProvider(
      providers: AppBlocProvider.getMainBlocProviderList(),
      child: BlocBuilder<ThemeCubit, ThemeStateModel>(
        builder: (context, state) {
          return ScreenUtilInit(
              designSize: Size(375, 812),
              minTextAdapt: true,
              child: MaterialApp.router(
                title: Application.applicationName,
                routerConfig: AppRouter.router,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                themeMode:
                    ServiceLocatorProvider.provide<ThemeCubit>().themeMode,
                // theme: ServiceLocatorProvider.provide<ThemeCubit>().themeData,
                theme: AppThemes.lightTheme,
                themeAnimationDuration: Duration(milliseconds: 0),
                darkTheme: AppThemes.darkTheme,
                debugShowCheckedModeBanner: false,
                builder: EasyLoading.init(),
              ));
        },
      ),
    );
  }
}
