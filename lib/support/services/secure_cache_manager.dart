import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum CacheKey { session }

abstract class SecureCacheManager {
  Future<void> write({required CacheKey key, required String value});
  Future<String?> read({required CacheKey key});
  Future<void> delete({required CacheKey key});
}

class SecureCacheManagerImpl implements SecureCacheManager {
  final _secureStorage = FlutterSecureStorage();

  @override
  Future<void> write({required CacheKey key, required String value}) async {
    await _secureStorage.write(key: key.name, value: value);
  }

  @override
  Future<String?> read({required CacheKey key}) async {
    return await _secureStorage.read(key: key.name);
  }

  @override
  Future<void> delete({required CacheKey key}) async {
    await _secureStorage.delete(key: key.name);
  }
}
