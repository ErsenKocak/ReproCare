import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:reprocare/common/logger/app_logger.dart';
import 'package:reprocare/core/constants/application/application.dart';

final class AppLocalNotificationHelper {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static int _notificationId = 0;
  static String _androidNotificationId =
      '${Application.applicationName}_NOTIFICATION_ID';

  static String _androidNotificationKey =
      '${Application.applicationName} _NOTIFICATION_KEY';

  static Future<void> initialize() async {
    await flutterLocalNotificationsPlugin.initialize(
      InitializationSettings(
        iOS: DarwinInitializationSettings(
          defaultPresentAlert: true,
          defaultPresentBadge: true,
          defaultPresentSound: true,
          requestAlertPermission: true,
          requestSoundPermission: true,
          requestBadgePermission: true,
          onDidReceiveLocalNotification: onDidReceiveLocalNotification,
        ),
        // android: AndroidInitializationSettings("@drawable/notification_icon"),
        android: AndroidInitializationSettings("ic_launcher"),
      ),
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );

    if (Platform.isAndroid) {
      await requestPermission();

      AppLogger.call(
          title: 'Android Notification Channel ID',
          value: _androidNotificationId);
      AndroidNotificationChannel androidNotificationChannel =
          AndroidNotificationChannel(
        _androidNotificationId,
        _androidNotificationKey,
        playSound: true,
        sound: RawResourceAndroidNotificationSound('alarm'),
        importance: Importance.max,
      );

      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(
            androidNotificationChannel,
          );
    }
  }

  static Future<void> requestPermission() async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  @pragma('vm:entry-point')
  static void onDidReceiveLocalNotification(
    int id,
    String? title,
    String? body,
    String? payload,
  ) {
    AppLogger.call(
      title:
          '------- App Local Notification Helper onDidReceiveLocalNotification -------',
      value:
          'ID - $id ------- TITLE $title ------- BODY - $body ------- PAYLOAD - $payload',
    );
  }

  @pragma('vm:entry-point')
  static void onDidReceiveNotificationResponse(
    NotificationResponse notificationResponse,
  ) {
    AppLogger.call(
      title:
          '------- App Local Notification Helper onDidReceiveNotificationResponse -------',
      value: 'Notification Response - ${notificationResponse.payload}',
    );
  }

  static Future<void> showNotification(RemoteMessage message) async {
    _notificationId++;

    try {
      // if (message.notification != null) {
      await flutterLocalNotificationsPlugin.show(
        _notificationId,
        message.notification!.title,
        message.notification!.body,
        NotificationDetails(
          iOS: DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
            sound: 'alarm.wav',
          ),
          android: AndroidNotificationDetails(
            _androidNotificationId,
            _androidNotificationKey,
            priority: Priority.high,
            showWhen: true,
            importance: Importance.max,
            enableVibration: true,
            playSound: true,
          ),
        ),
        payload: jsonEncode(message.data),
      );

      // if (Platform.isIOS) {
      //   await flutterLocalNotificationsPlugin.show(
      //     _notificationId,
      //     message.notification!.title,
      //     message.notification!.body,
      //     NotificationDetails(
      //       iOS: DarwinNotificationDetails(
      //         presentAlert: true,
      //         presentBadge: true,
      //         presentSound: true,
      //         sound: 'default',
      //       ),
      //     ),
      //     payload: jsonEncode(message.data),
      //   );
      // } else {
      //   await flutterLocalNotificationsPlugin.show(
      //     _notificationId,
      //     message.notification!.title,
      //     message.notification!.body,
      //     NotificationDetails(
      //           iOS: DarwinNotificationDetails(
      //         presentAlert: true,
      //         presentBadge: true,
      //         presentSound: true,
      //         sound: 'default',
      //       ),
      //       android: AndroidNotificationDetails(
      //         _androidNotificationId,
      //         _androidNotificationKey,
      //         priority: Priority.high,
      //         showWhen: true,
      //         importance: Importance.max,
      //         enableVibration: true,
      //         playSound: true,
      //         sound: RawResourceAndroidNotificationSound('alarm'),
      //       ),
      //     ),
      //     payload: jsonEncode(message.data),
      //   );
      // }
      // }
    } catch (e) {
      log('Catche düştü');
      log(e.toString());
    }
  }

  static showLocalNotification({
    String? title,
    String? body,
    Map<String, dynamic>? data,
  }) {
    showNotification(
      RemoteMessage(
        data: data ?? {},
        notification: RemoteNotification(
          title: title,
          body: body,
        ),
      ),
    );
  }
}
