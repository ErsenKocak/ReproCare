import 'package:flutter/material.dart';

import 'package:reprocare/core/enums/app_mode/app_mode.dart';

class Application {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> shellNavigatorKey =
      GlobalKey<NavigatorState>();

  static BuildContext get applicationContext => navigatorKey.currentContext!;

  /// Updated from env.json file.
  static int versionCode = 0;
  static String versionName = '';
  static String applicationName = 'ReproCare';
  static AppMode appMode = AppMode.unknown;
  static String apiBaseUrl = '';
  static String firebaseTopic = '';
}
