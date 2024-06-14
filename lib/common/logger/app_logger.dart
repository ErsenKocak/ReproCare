import 'package:logger/logger.dart';
import 'package:reprocare/common/logger/log_json.dart';
import 'package:reprocare/common/logger/release_mode_logger_filter.dart';
import 'package:reprocare/core/constants/application/application.dart';
import 'package:reprocare/core/enums/app_mode/app_mode.dart';

final class AppLogger {
  static Logger _logger = Logger(
    filter: ReleaseModeLoggerFilter(),
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 400,
      colors: true,
      printEmojis: true,
      printTime: false,
    ),
  );

  static call({dynamic value, Level? logLevel, String? title}) {
    // if (Application.appMode == AppMode.production) return;

    _logger.log(
      logLevel ?? Level.fatal,
      LogJson.format(value, title: title),
    );

    /// Alternative

    // log(
    //     level: logLevel?.value ?? Level.fatal.value,
    //     LogJson.format(value, title: title));
  }
}
