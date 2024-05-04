import 'package:hive/hive.dart';
import 'package:reprocare/core/cache/i_cache_manager.dart';

abstract class HiveCacheManager<T> extends ICacheManager<T> {
  String get boxName;
  Box<T>? _box;

  @override
  Future<void> initialize() async {
    registerAdapters();
    if (_box?.isOpen != true) {
      _box = await Hive.box(name: boxName);
    }
  }

  void registerAdapters();

  @override
  Future<T?> get(String key) async {
    final value = await _box?.get(key);
    return value;
  }

  @override
  List<T?>? getAll(Iterable<String> keys) {
    return _box?.getAll(keys).toList();
  }

  @override
  void add(T item) {
    _box?.add(item);
  }

  @override
  void addList(List<T> items) {
    _box?.addAll(items);
  }

  @override
  bool? delete(String key) {
    return _box?.delete(key);
  }

  @override
  void put(String key, T item) async {
    _box?.put(key, item);
  }

  @override
  void putAll(Map<String, T> mapObject) async {
    _box?.putAll(mapObject);
  }

  @override
  Future<void> deleteAll(Iterable<String> keys) async {
    _box?.deleteAll(keys);
  }
}
