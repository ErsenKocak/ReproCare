import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:reprocare/core/constants/colors/app_light_colors.dart';

class AppLoading {
  static void initialize() {
    EasyLoading.instance
      ..displayDuration = const Duration(seconds: 10)
      ..indicatorType = EasyLoadingIndicatorType.threeBounce
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 0
      ..radius = 100.0
      ..contentPadding = EdgeInsets.all(10)
      ..progressColor = Colors.transparent
      ..backgroundColor = Colors.transparent
      ..indicatorColor = Colors.transparent
      ..textColor = Colors.transparent
      ..boxShadow = []
      ..userInteractions = false
      ..dismissOnTap = false
      ..maskType = EasyLoadingMaskType.black
      ..toastPosition = EasyLoadingToastPosition.center
      ..animationStyle = EasyLoadingAnimationStyle.scale;
  }

  static showLoading() {
    if (!EasyLoading.isShow) {
      EasyLoading.show(
        indicator: getLoadingWidget,
      );
    }
  }

  static get getLoadingWidget {
    return LoadingAnimationWidget.discreteCircle(
      color: Colors.white,
      secondRingColor: AppLightColors.primaryColor,
      thirdRingColor: AppLightColors.black,
      size: 50.h,
    );
  }

  static dismissLoading() => EasyLoading.dismiss();
}
