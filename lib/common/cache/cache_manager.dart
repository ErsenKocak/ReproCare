import 'dart:convert';
import 'package:reprocare/common/cache/i_cache_service.dart';
import 'package:reprocare/common/logger/app_logger.dart';
import 'package:logger/logger.dart';

class CacheManager<T> {
  final ICacheService _cacheService;
  final String _prefix = 'jlex';

  CacheManager({required ICacheService cacheService})
      : _cacheService = cacheService;

  String _getPrefixedKey(String key) => '${_prefix}_$key';

  Future<void> setObject(String key, T object) async {
    try {
      final jsonString = jsonEncode(object);
      AppLogger.call(
        value: jsonString,
        title: 'CacheManager.setObject',
        logLevel: Level.error,
      );
      await _cacheService.add(_getPrefixedKey(key), jsonString);
    } catch (e) {
      AppLogger.call(
        value: e,
        title: 'CacheManager.setObject error',
        logLevel: Level.error,
      );
      rethrow;
    }
  }

  Future<T?> getObject(
    String key,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    try {
      final jsonString = await _cacheService.get(_getPrefixedKey(key));
      if (jsonString == null) return null;

      final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
      AppLogger.call(
        value: jsonMap,
        title: 'CacheManager.getObject',
        logLevel: Level.error,
      );
      return fromJson(jsonMap);
    } catch (e) {
      AppLogger.call(
        value: e,
        title: 'CacheManager.getObject error',
        logLevel: Level.error,
      );
      return null;
    }
  }

  Future<void> setString(String key, String value) async {
    try {
      await _cacheService.add(_getPrefixedKey(key), value);
      AppLogger.call(
        value: value,
        title: 'CacheManager.setString',
        logLevel: Level.error,
      );
    } catch (e) {
      AppLogger.call(
        value: e,
        title: 'CacheManager.setString error',
        logLevel: Level.error,
      );
      rethrow;
    }
  }

  Future<String?> getString(String key) async {
    try {
      return await _cacheService.get(_getPrefixedKey(key));
    } catch (e) {
      AppLogger.call(
        value: e,
        title: 'CacheManager.getString error',
        logLevel: Level.error,
      );
      return null;
    }
  }

  Future<void> setInt(String key, int value) async {
    await _cacheService.add(_getPrefixedKey(key), value.toString());
  }

  Future<int?> getInt(String key) async {
    final value = await _cacheService.get(_getPrefixedKey(key));
    return value != null ? int.tryParse(value) : null;
  }

  Future<void> setBool(String key, bool value) async {
    await _cacheService.add(_getPrefixedKey(key), value.toString());
  }

  Future<bool?> getBool(String key) async {
    final value = await _cacheService.get(_getPrefixedKey(key));
    return value != null ? value.toLowerCase() == 'true' : null;
  }

  Future<void> setDouble(String key, double value) async {
    await _cacheService.add(_getPrefixedKey(key), value.toString());
  }

  Future<double?> getDouble(String key) async {
    final value = await _cacheService.get(_getPrefixedKey(key));
    return value != null ? double.tryParse(value) : null;
  }

  Future<void> remove(String key) async {
    await _cacheService.delete(_getPrefixedKey(key));
  }

  Future<bool> containsKey(String key) async {
    return await _cacheService.containsKey(_getPrefixedKey(key));
  }
}
