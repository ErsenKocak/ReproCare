import 'package:reprocare/core/cache/hive_cache_manager.dart';
import 'package:reprocare/features/login/domain/entities/response/login_response_entity/login_response_entity.dart';

abstract class IAuthLocalService
    extends HiveCacheManager<LoginResponseEntity> {}
