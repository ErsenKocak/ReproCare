import 'package:dio/dio.dart';

class AppCancelToken {
  static late CancelToken cancelToken;

  static void initialize() {
    cancelToken = CancelToken();
  }
}
