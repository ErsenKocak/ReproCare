import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:reprocare/common/cache/i_cache_service.dart';
import 'package:logger/logger.dart';
import 'package:reprocare/common/logger/app_logger.dart';

class SecureCacheService implements ICacheService {
  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
      sharedPreferencesName: 'reprocare_secure_prefs',
      preferencesKeyPrefix: 'reprocare_',
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
      accountName: 'reprocare_account',
    ),
    wOptions: WindowsOptions(),
    lOptions: LinuxOptions(),
    mOptions: MacOsOptions(
      accessibility: KeychainAccessibility.first_unlock,
      accountName: 'reprocare_account',
      synchronizable: true,
      useDataProtectionKeyChain: true,
      groupId: 'reprocare_group',
    ),
    webOptions: WebOptions(
      dbName: 'reprocare_secure_storage',
      publicKey: 'reprocare_public_key',
    ),
  );

  @override
  Future<String?> get(String key) async {
    try {
      return await _storage.read(key: key);
    } catch (e) {
      AppLogger.call(
        value: e,
        title: 'SecureCacheService.get error',
        logLevel: Level.error,
      );
      return null;
    }
  }

  @override
  Future<void> add(String key, String value) async {
    try {
      await _storage.write(key: key, value: value);
    } catch (e) {
      AppLogger.call(
        value: e,
        title: 'SecureCacheService.set error',
        logLevel: Level.error,
      );
      rethrow;
    }
  }

  @override
  Future<void> delete(String key) async {
    try {
      await _storage.delete(key: key);
    } catch (e) {
      AppLogger.call(
        value: e,
        title: 'SecureCacheService.delete error',
        logLevel: Level.error,
      );
    }
  }

  @override
  Future<void> clear() async {
    try {
      await _storage.deleteAll();
    } catch (e) {
      AppLogger.call(
        value: e,
        title: 'SecureCacheService.clear error',
        logLevel: Level.error,
      );
    }
  }

  @override
  Future<bool> containsKey(String key) async {
    try {
      final value = await _storage.read(key: key);
      return value != null;
    } catch (e) {
      AppLogger.call(
        value: e,
        title: 'SecureCacheService.containsKey error',
        logLevel: Level.error,
      );
      return false;
    }
  }

  @override
  Future<Set<String>> getAllKeys() async {
    try {
      final allValues = await _storage.readAll();
      return allValues.keys.toSet();
    } catch (e) {
      AppLogger.call(
        value: e,
        title: 'SecureCacheService.getAllKeys error',
        logLevel: Level.error,
      );
      return <String>{};
    }
  }
}
