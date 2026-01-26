import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:logger/logger.dart';
import 'package:reprocare/common/cache/cache_manager.dart';
import 'package:reprocare/common/init/service_locator/service_locator_provider.dart';
import 'package:reprocare/common/logger/app_logger.dart';
import 'package:reprocare/core/constants/application/application.dart';
import 'package:reprocare/core/constants/cache/cache_constants.dart';
import 'package:reprocare/features/notification_settings/domain/entities/notification_sound_item/notification_sound_item.dart';

final class AppLocalNotificationHelper {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static int _notificationId = 0;
  static String _androidNotificationId =
      '${Application.applicationName}_NOTIFICATION_ID';

  static String _androidNotificationKey =
      '${Application.applicationName} _NOTIFICATION_KEY';

  static Future<void> initialize() async {
    await flutterLocalNotificationsPlugin.cancelAll();

    CacheManager _notificationLocalService =
        ServiceLocatorProvider.provide<CacheManager>();
    NotificationSoundItem? notificationSound =
        await _notificationLocalService.getObject(
            CacheConstants.NotificationSettings.name,
            NotificationSoundItem.fromJson);
    AppLogger.call(
        title: 'Local Notification Helper -- Initialize --  Notification Sound',
        value: notificationSound?.toJson());

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
        android: AndroidInitializationSettings("@drawable/notification_icon"),
      ),
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );

    if (Platform.isAndroid) {
      await requestPermission();

      _androidNotificationId =
          '${_androidNotificationId}_${Random().nextInt(99999999)}';

      AppLogger.call(
          title: 'Android Notification Channel ID',
          value: _androidNotificationId);
      AndroidNotificationChannel androidNotificationChannel =
          AndroidNotificationChannel(
        _androidNotificationId,
        _androidNotificationKey,
        playSound: true,
        importance: Importance.max,
        enableVibration: true,
        showBadge: true,

        sound: notificationSound?.name != null
            ? RawResourceAndroidNotificationSound(
                notificationSound?.name.toLowerCase())
            : null,
        // sound: RawResourceAndroidNotificationSound('run'),
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
    try {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.requestNotificationsPermission();
    } catch (e) {}
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
    CacheManager _notificationLocalService =
        ServiceLocatorProvider.provide<CacheManager>();
    NotificationSoundItem? notificationSound =
        await _notificationLocalService.getObject(
            CacheConstants.NotificationSettings.name,
            NotificationSoundItem.fromJson);
    AppLogger.call(
        title:
            'Local Notification Helper -- Show Notification --  Notification Sound',
        value: notificationSound?.toJson());

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
            sound: notificationSound?.fileName ?? 'default',
            // sound: 'sound.wav', //Sample
          ),
          android: AndroidNotificationDetails(
            _androidNotificationId,
            _androidNotificationKey,
            priority: Priority.high,
            showWhen: true,
            importance: Importance.max,
            enableVibration: true,
            playSound: true,
            // sound: RawResourceAndroidNotificationSound('alarm'),
            // sound: RawResourceAndroidNotificationSound(
            //     notificationSound?.name.toLowerCase() ?? 'run'),
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
      AppLogger.call(
          title: 'Local Notification Helper ERROR',
          value: e.toString(),
          logLevel: Level.error);
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
