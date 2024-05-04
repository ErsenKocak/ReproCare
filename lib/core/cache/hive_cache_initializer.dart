import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveCacheInitializer {
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.defaultDirectory = dir.path;
  }
}
