import 'package:logger/logger.dart';

class ReleaseModeLoggerFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) => true;
}
