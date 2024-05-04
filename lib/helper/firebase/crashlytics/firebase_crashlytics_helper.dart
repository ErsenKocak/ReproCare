import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:reprocare/core/constants/application/application.dart';
import 'package:reprocare/core/enums/app_mode/app_mode.dart';

class FirebaseCrashlyticsHelper {
  static late FirebaseCrashlytics _instance;

  static Future<void> initialize() async {
    _instance = FirebaseCrashlytics.instance;
    bool isCrashlyticsActive = true ??
        Application.appMode != AppMode.development &&
            Application.appMode != AppMode.test;

    await _instance.setCrashlyticsCollectionEnabled(isCrashlyticsActive);
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  }

  static Future<void> testCrash() async {
    _instance.crash();
  }
}
