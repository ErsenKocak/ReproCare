import 'package:hive/hive.dart';
import 'package:reprocare/common/cubit/theme/data/services/i_theme_local_service.dart';
import 'package:reprocare/common/cubit/theme/theme_state_model.dart';
import 'package:reprocare/core/constants/cache/cache_constants.dart';

class ThemeLocalService extends IThemeLocalService {
  ThemeLocalService() {
    initialize();
  }
  @override
  String get boxName => CacheConstants.Theme.name;

  @override
  void registerAdapters() {
    Hive.registerAdapter(
      CacheConstants.Theme.name,
      (json) => ThemeStateModel.fromJson(json),
    );
  }
}
