import 'package:get_it/get_it.dart';

import '../secure_cache_manager.dart';
import '../session_manager.dart';

class CommonModule {
  static void init(GetIt injector) {
    injector.registerSingleton<SecureCacheManager>(SecureCacheManagerImpl());
    injector.registerSingleton<SessionManager>(SessionManagerImpl(secureCacheManager: injector()));
  }
}
