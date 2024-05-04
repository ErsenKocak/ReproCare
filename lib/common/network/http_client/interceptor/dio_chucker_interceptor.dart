import 'package:chucker_flutter/chucker_flutter.dart';

class DioChuckerInterceptor {
  static initalize() {
    ChuckerFlutter.showNotification = false;
    ChuckerFlutter.showOnRelease = true;
    ChuckerFlutter.isDebugMode = false;
  }

  static ChuckerDioInterceptor getInterceptor() {
    return ChuckerDioInterceptor();
  }
}
