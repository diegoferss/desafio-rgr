import '../secure_cache_manager.dart';
import '../session_manager.dart';
import 'app_module.dart';
import 'injector.dart';

class CommonModule extends AppModule {
  @override
  void registerDependencies() {
    injector.registerSingleton<SecureCacheManager>(SecureCacheManagerImpl());
    injector.registerSingleton<SessionManager>(
      SessionManagerImpl(secureCacheManager: injector.get<SecureCacheManager>()),
    );
  }
}
