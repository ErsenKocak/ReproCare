import 'package:reprocare/core/cache/hive_cache_manager.dart';
import 'package:reprocare/features/settings/domain/entities/response/user_settings_entity/user_entity.dart';

abstract class IAuthLocalService extends HiveCacheManager<UserEntity> {}
