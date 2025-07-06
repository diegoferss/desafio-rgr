import 'package:shared_preferences/shared_preferences.dart';

enum CacheKey { session }

abstract class CacheManager {
  Future<void> initialize();
  String? readString({required CacheKey key});
  Future<void> saveString({required CacheKey key, required String value});
  Future<void> delete({required CacheKey key});
}

class CacheManagerImpl extends CacheManager {
  late final SharedPreferences _sharedPreferences;

  @override
  Future<void> initialize() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  String? readString({required CacheKey key}) {
    return _sharedPreferences.getString(key.name);
  }

  @override
  Future<void> saveString({required CacheKey key, required String value}) async {
    await _sharedPreferences.setString(key.name, value);
  }

  @override
  Future<void> delete({required CacheKey key}) async {
    await _sharedPreferences.remove(key.name);
  }
}
