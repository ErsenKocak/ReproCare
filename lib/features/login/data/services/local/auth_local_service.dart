import 'package:hive/hive.dart';
import 'package:reprocare/core/constants/cache/cache_constants.dart';
import 'package:reprocare/features/login/data/services/local/i_auth_local_service.dart';
import 'package:reprocare/features/settings/domain/entities/response/user_settings_entity/user_entity.dart';

class AuthLocalService extends IAuthLocalService {
  AuthLocalService() {
    initialize();
  }
  @override
  String get boxName => CacheConstants.User.name;

  @override
  void registerAdapters() {
    Hive.registerAdapter(
      CacheConstants.User.name,
      (json) => UserEntity.fromJson(json),
    );
  }
}
