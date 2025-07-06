import '../../models/user.dart';
import 'secure_cache_manager.dart';

abstract class SessionManager {
  User? get user;
  bool get hasSession;
  Future<void> saveSession(User user, bool rememberPassword);
  Future<void> loadSession();
  Future<void> deleteSession();
}

class SessionManagerImpl implements SessionManager {
  final SecureCacheManager secureCacheManager;

  SessionManagerImpl({required this.secureCacheManager});

  User? _user;

  @override
  User? get user => _user;

  @override
  bool get hasSession => _user != null;

  @override
  Future<void> saveSession(User user, bool rememberPassword) async {
    _user = user;
    await secureCacheManager.write(key: CacheKey.session, value: user.json);
  }

  @override
  Future<void> loadSession() async {
    final data = await secureCacheManager.read(key: CacheKey.session);

    _user = User.fromJson(data);
  }

  @override
  Future<void> deleteSession() async {
    await secureCacheManager.delete(key: CacheKey.session);
  }
}
