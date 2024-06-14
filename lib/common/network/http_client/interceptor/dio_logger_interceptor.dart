import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:reprocare/core/constants/application/application.dart';
import 'package:reprocare/core/enums/app_mode/app_mode.dart';

class DioLoggerInterceptor {
  static PrettyDioLogger getInterceptor() {
    bool isLogActive = true ?? Application.appMode != AppMode.production;

    return PrettyDioLogger(
      requestHeader: isLogActive,
      request: isLogActive,
      requestBody: isLogActive,
      responseBody: isLogActive,
      error: isLogActive,
      responseHeader: false,
      compact: isLogActive,
      maxWidth: 300,
    );
  }
}
