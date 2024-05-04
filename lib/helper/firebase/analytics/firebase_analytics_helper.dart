import 'package:firebase_analytics/firebase_analytics.dart';

class FirebaseAnalyticsHelper {
  static late FirebaseAnalytics _instance;

  static Future<void> initialize() async {
    _instance = FirebaseAnalytics.instance;
    await _instance.setAnalyticsCollectionEnabled(true);
  }

  static Future<void> logScreenView(String screenName) async {
    await _instance.logScreenView(
      screenName: screenName,
      screenClass: 'App Views',
    );
  }

  static FirebaseAnalyticsObserver get navigatorObserver =>
      FirebaseAnalyticsObserver(analytics: _instance);
}
