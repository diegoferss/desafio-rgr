import 'package:rgr/support/services/injector/app_module.dart';
import 'package:rgr/support/services/injector/injector.dart';

import '../bloc/login_bloc.dart';

class LoginModule extends AppModule {
  @override
  void registerDependencies() {
    injector.registerFactory<LoginBloc>(() => LoginBloc());
  }
}