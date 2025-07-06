import 'package:get_it/get_it.dart';

import '../../../data/di/data_module.dart';
import '../../../features/login/di/login_module.dart';
import '../../../features/splash/di/splash_module.dart';
import 'app_module.dart';
import 'common_module.dart';

abstract class InjectorProtocol {
  T get<T extends Object>({dynamic param1, dynamic param2});
  void registerFactory<T extends Object>(T Function() factory);
  void registerFactoryWithParams<T extends Object, K>(T Function(K) factory);
  void registerSingleton<T extends Object>(T instance);
  void registerLazySingleton<T extends Object>(T Function() factory);
  void registerModules();
}

class Injector implements InjectorProtocol {
  final GetIt _getIt = GetIt.instance;

  @override
  T get<T extends Object>({dynamic param1, dynamic param2}) {
    return _getIt.get<T>(param1: param1, param2: param2);
  }

  @override
  void registerFactory<T extends Object>(T Function() factory) {
    _getIt.registerFactory<T>(factory);
  }

  @override
  void registerFactoryWithParams<T extends Object, K>(T Function(K p1) factory) {
    _getIt.registerFactoryParam<T, K, void>((param1, _) => factory(param1));
  }

  @override
  void registerSingleton<T extends Object>(T instance) {
    _getIt.registerSingleton<T>(instance);
  }

  @override
  void registerLazySingleton<T extends Object>(T Function() factory) {
    _getIt.registerLazySingleton<T>(factory);
  }

  @override
  void registerModules() {
    final modules = <AppModule>[CommonModule(), DataModule(), SplashModule(), LoginModule()];

    for (final module in modules) {
      module.registerDependencies();
    }
  }
}

final InjectorProtocol injector = Injector();
