import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';

class FirebaseAnalyticsHelper {
  static late FirebaseAnalytics _instance;

  static Future<void> initialize() async {
    _instance = FirebaseAnalytics.instance;
    await _instance.setAnalyticsCollectionEnabled(true);
  }

  static Future<void> logScreenView(String screenName) async {
    if (!kIsWeb && (!Platform.isAndroid && !Platform.isIOS)) return;
    await _instance.logScreenView(
      screenName: screenName,
      screenClass: 'App Views',
    );
  }

  static FirebaseAnalyticsObserver get navigatorObserver =>
      FirebaseAnalyticsObserver(analytics: _instance);
}
