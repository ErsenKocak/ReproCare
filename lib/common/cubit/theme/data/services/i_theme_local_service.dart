import 'package:reprocare/common/cubit/theme/theme_state_model.dart';
import 'package:reprocare/core/cache/hive_cache_manager.dart';

abstract class IThemeLocalService extends HiveCacheManager<ThemeStateModel> {}
