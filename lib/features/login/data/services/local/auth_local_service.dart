import 'package:hive/hive.dart';
import 'package:reprocare/core/constants/cache/cache_constants.dart';
import 'package:reprocare/features/login/data/services/local/i_auth_local_service.dart';
import 'package:reprocare/features/login/domain/entities/response/login_response_entity/login_response_entity.dart';

class AuthLocalService extends IAuthLocalService {
  AuthLocalService() {
    initialize();
  }
  @override
  String get boxName => CacheConstants.AccessToken.name;

  @override
  void registerAdapters() {
    Hive.registerAdapter(
      CacheConstants.AccessToken.name,
      (json) => LoginResponseEntity.fromJson(json),
    );
  }
}
