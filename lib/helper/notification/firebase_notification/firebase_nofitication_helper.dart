import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:reprocare/common/logger/app_logger.dart';
import 'package:reprocare/firebase_options.dart';
import 'package:reprocare/helper/notification/local_notification/local_notification_helper.dart';

final class FirebaseNotificationHelper {
  static FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  static initialize() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
      // name: Application.applicationName,
    );

    await getToken;
    // await requestPermission();
    FirebaseMessaging.onMessage.listen(_handleForegroundNotification);
    FirebaseMessaging.onBackgroundMessage(_handleBackgroundNotification);
    FirebaseMessaging.onMessageOpenedApp
        .listen((RemoteMessage message) => _onNotificationClick(message.data));
    // await subscribeToTopic(Application.firebaseTopic);
  }

  static Future<void> _handleForegroundNotification(
    RemoteMessage message,
  ) async {
    AppLogger.call(
      title: 'Handle Foreground Notification',
      value: message.toMap(),
    );

    await AppLocalNotificationHelper.showNotification(message);

    return Future.value();
  }

  @pragma('vm:entry-point')
  static Future<void> _handleBackgroundNotification(
    RemoteMessage message,
  ) async {
    AppLogger.call(
      title: 'Handle Background Notification',
      value: message.toString(),
    );
    return Future.value();
  }

  @pragma('vm:entry-point')
  static Future<dynamic> _onNotificationClick(
    Map<String, dynamic>? notificationMap,
  ) async {
    AppLogger.call(
      title: 'Notification Clicked',
      value: notificationMap,
    );

    // navigateToScreen(type: type, itemId: itemId);
  }

  static Future<void> checkInitialMessage() async {
    RemoteMessage? initialMessage = await firebaseMessaging.getInitialMessage();

    AppLogger.call(
      title: 'Initial Message',
      value: initialMessage?.data,
    );

    if (initialMessage != null) _onNotificationClick(initialMessage.data);
  }

  static Future<void> requestPermission() async {
    await firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: true,
      sound: true,
    );
  }

  static Future<String?> get getToken async {
    String? notificationToken = await firebaseMessaging.getToken();
    AppLogger.call(
      title: 'Notification Token',
      value: notificationToken,
    );

    return notificationToken;
  }

  static Future<void> subscribeToTopic(String topic) async {
    AppLogger.call(
      title: 'Subscribe to Topic',
      value: topic,
    );
    await firebaseMessaging.subscribeToTopic(topic);
  }
}
