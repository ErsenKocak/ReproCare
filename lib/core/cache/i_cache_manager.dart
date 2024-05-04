abstract class ICacheManager<T> {
  Future<void> initialize();

  Future<T?> get(String key);
  List<T?>? getAll(Iterable<String> keys);

  void add(T item);

  void addList(List<T> items);

  void put(String key, T item);

  void putAll(Map<String, T> mapObject);

  bool? delete(String key);

  Future<void> deleteAll(Iterable<String> keys);
}
