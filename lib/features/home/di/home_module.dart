import 'package:rgr/support/services/injector/injector.dart';

import '../../../support/services/injector/app_module.dart';
import '../../../support/services/session_manager.dart';
import '../bloc/home_bloc.dart';

class HomeModule extends AppModule {
  @override
  void registerDependencies() {
    injector.registerFactory<HomeBloc>(() => HomeBloc(sessionManager: injector.get<SessionManager>()));
  }
}
