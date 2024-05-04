import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';

class DioRetryInterceptor {
  static RetryInterceptor getInterceptor({required Dio dio}) {
    return RetryInterceptor(
      retries: 0,
      dio: dio,
    );
  }
}
