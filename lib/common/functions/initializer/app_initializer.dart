import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reprocare/common/network/http_client/interceptor/dio_chucker_interceptor.dart';
import 'package:reprocare/common/network/http_client/model/cancel_token.dart';
import 'package:reprocare/common/widgets/app_loading/app_loading.dart';
import 'package:reprocare/core/cache/hive_cache_initializer.dart';
import 'package:reprocare/core/constants/application/application.dart';
import 'package:reprocare/core/enums/app_mode/app_mode.dart';
import 'package:reprocare/common/init/service_locator/service_locator.dart'
    as dependencyInjection;
import 'package:reprocare/helper/firebase/analytics/firebase_analytics_helper.dart';
import 'package:reprocare/helper/firebase/crashlytics/firebase_crashlytics_helper.dart';
import 'package:reprocare/helper/notification/firebase_notification/firebase_nofitication_helper.dart';
import 'package:reprocare/helper/notification/local_notification/local_notification_helper.dart';

class AppInitializer {
  //TODO
  static initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    await setAppEnviroments();
    await HiveCacheInitializer.initialize();
    await dependencyInjection.initalize();
    await AppLocalNotificationHelper.initialize();
    await FirebaseNotificationHelper.initialize();
    await FirebaseAnalyticsHelper.initialize();
    await FirebaseCrashlyticsHelper.initialize();

    AppLoading.initialize();
    DioChuckerInterceptor.initalize();
    AppCancelToken.initialize();
  }

  static Future<void> setAppEnviroments() async {
    String environmentString = await rootBundle.loadString('.env.json');
    Map environment = jsonDecode(environmentString);

    Application.appMode = AppMode.values[environment["environmentMode"]];
    late String platformKey;
    platformKey = Platform.operatingSystem;
    Application.applicationName =
        '${environment["applicationName"]}${Application.appMode.appTag}';
    Application.apiBaseUrl =
        environment["apiBaseUrl"][Application.appMode.path];
    Application.versionName =
        environment["versionName"][Application.appMode.path][platformKey];
    Application.versionCode =
        environment["versionCode"][Application.appMode.path][platformKey];
    Application.firebaseTopic = environment["firebaseTopic"];

    log('API BASE URL -- ${Application.apiBaseUrl}');
    log('VERSION NAME -- ${Application.versionName}');
    log('VERSION CODE -- ${Application.versionCode}');
    log('Application Name -- ${Application.applicationName}');
    log('App Mode -- ${Application.appMode}');
    log('Bundle ID -- ${environment["bundleId"][Application.appMode.path][platformKey]}');
  }
}
