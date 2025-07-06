import 'package:rgr/support/services/injector/app_module.dart';
import 'package:rgr/support/services/injector/injector.dart';

import '../../../support/services/session_manager.dart';
import '../bloc/splash_bloc.dart';

class SplashModule extends AppModule {
  @override
  void registerDependencies() {
    injector.registerFactory<SplashBloc>(() => SplashBloc(sessionManager: injector.get<SessionManager>()));
  }
}
