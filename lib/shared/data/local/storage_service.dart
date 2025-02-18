abstract class StorageService {
  void init();

  bool get hasInitialized;

  Future<bool> remove(String key);

  Future<Object?> get(String key);
  Future<String?> getString(String key);

  Future<bool> setString(String key, String data);
  Future<bool> setStringList(String key, List<String> data);
  Future<List<String>?> getStringList(String key);

  Future<bool?> setBool(String key, bool data);
  Future<bool?> getBool(String key);

  Future<void> clear();

  Future<bool> has(String key);
}
