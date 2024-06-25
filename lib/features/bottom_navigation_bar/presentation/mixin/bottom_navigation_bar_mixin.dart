import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:reprocare/common/base/mixin/base_mixin.dart';
import 'package:reprocare/common/base/model/request/pagination_request_param/pagination_request_param.dart';
import 'package:reprocare/common/init/service_locator/service_locator_provider.dart';
import 'package:reprocare/common/router/app_router.dart';
import 'package:reprocare/common/router/app_routes.dart';
import 'package:reprocare/features/bottom_navigation_bar/presentation/view/bottom_navigation_bar_view.dart';
import 'package:reprocare/features/device/domain/entities/request/user_device_request_param/user_device_request_param.dart';
import 'package:reprocare/features/device/presentation/cubit/device_cubit.dart';
import 'package:reprocare/features/notification/domain/entities/request/notification_token_request_param/notification_token_request_param.dart';
import 'package:reprocare/features/notification/presentation/cubit/notification_cubit.dart';
import 'package:reprocare/helper/firebase/analytics/firebase_analytics_helper.dart';
import 'package:reprocare/helper/localization/localization_helper.dart';
import 'package:reprocare/helper/notification/firebase_notification/firebase_nofitication_helper.dart';

mixin BottomNavigationBarMixin on State<BottomNavigationBarView> {
  late ValueNotifier<int> activeIndexNotifier;
  late DeviceCubit deviceCubit;
  late NotificationCubit notificationCubit;

  @override
  void initState() {
    super.initState();
    initializeMixin();
  }

  Future<void> initializeMixin() async {
    activeIndexNotifier = ValueNotifier<int>(0);
    deviceCubit = ServiceLocatorProvider.provide<DeviceCubit>();
    notificationCubit = ServiceLocatorProvider.provide<NotificationCubit>();
    await AppLocalizationHelper.initialize();
    await initializeServices();
  }

  Future<void> initializeServices() async {
    await insertUserDevice();
  }

  Future<void> insertUserDevice() async {
    UserDeviceRequestParam deviceInfo = await deviceCubit.getDeviceInfo();
    await deviceCubit.insertUserDevice(deviceInfo);
    await insertNotificationToken();
  }

  Future<void> insertNotificationToken() async {
    if (deviceCubit.currentUserDevice != null) {
      String? token = await FirebaseNotificationHelper.getToken;
      if (token != '' && token != null) {
        await notificationCubit.insertNotificationToken(
          NotificationTokenRequestParam(
            deviceId: deviceCubit.currentUserDevice!.deviceId,
            pushNotificationToken: token,
          ),
        );
      }
    }
  }

  void navigate(int index) {
    var bottomNavigatorRoute = '';
    activeIndexNotifier.value = index;
    switch (index) {
      case 0:
        bottomNavigatorRoute = AppRoutes.Notification.path;
      case 1:
        bottomNavigatorRoute = AppRoutes.Settings.path;
    }
    FirebaseAnalyticsHelper.logScreenView(bottomNavigatorRoute);
    AppRouter.goNamed(bottomNavigatorRoute);
  }
}
