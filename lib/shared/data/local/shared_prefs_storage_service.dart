import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import 'storage_service.dart';

class SharedPrefsService implements StorageService {
  SharedPreferences? sharedPreferences;

  final Completer<SharedPreferences> initCompleter =
      Completer<SharedPreferences>();

  @override
  void init() {
    initCompleter.complete(SharedPreferences.getInstance());
  }

  @override
  bool get hasInitialized => sharedPreferences != null;

  @override
  Future<Object?> get(String key) async {
    sharedPreferences = await initCompleter.future;
    return sharedPreferences!.get(key);
  }

  @override
  Future<void> clear() async {
    sharedPreferences = await initCompleter.future;
    await sharedPreferences!.clear();
  }

  @override
  Future<bool> has(String key) async {
    sharedPreferences = await initCompleter.future;
    return sharedPreferences?.containsKey(key) ?? false;
  }

  @override
  Future<bool> remove(String key) async {
    sharedPreferences = await initCompleter.future;
    return await sharedPreferences!.remove(key);
  }

  @override
  Future<bool> setString(String key, data) async {
    sharedPreferences = await initCompleter.future;
    return await sharedPreferences!.setString(key, data.toString());
  }

  @override
  Future<bool> setStringList(String key, List<String> data) async {
    sharedPreferences = await initCompleter.future;
    return await sharedPreferences!.setStringList(key, data);
  }

  @override
  Future<List<String>?> getStringList(String key) async {
    sharedPreferences = await initCompleter.future;
    return sharedPreferences!.getStringList(key);
  }

  @override
  Future<String?> getString(String key) async {
    sharedPreferences = await initCompleter.future;
    return sharedPreferences!.getString(key);
  }

  @override
  Future<bool?> getBool(String key) async {
    sharedPreferences = await initCompleter.future;
    return sharedPreferences!.getBool(key);
  }

  @override
  Future<bool?> setBool(String key, bool data) async {
    sharedPreferences = await initCompleter.future;
    return sharedPreferences!.setBool(key, data);
  }
}
