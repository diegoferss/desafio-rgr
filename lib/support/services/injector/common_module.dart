import '../secure_cache_manager.dart';
import '../session_manager.dart';
import '../url_launcher.dart';
import 'app_module.dart';
import 'injector.dart';

class CommonModule extends AppModule {
  @override
  void registerDependencies() {
    injector.registerSingleton<CacheManager>(CacheManagerImpl());
    injector.registerSingleton<SessionManager>(SessionManagerImpl(secureCacheManager: injector.get<CacheManager>()));
    injector.registerSingleton<UrlLauncher>(UrlLauncherImpl());
  }
}
