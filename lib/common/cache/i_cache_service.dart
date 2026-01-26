abstract class ICacheService {
  Future<String?> get(String key);

  Future<void> add(String key, String value);

  Future<void> delete(String key);

  Future<void> clear();

  Future<bool> containsKey(String key);
}
