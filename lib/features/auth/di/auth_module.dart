import 'package:rgr/support/services/injector/app_module.dart';
import 'package:rgr/support/services/injector/injector.dart';

import '../../../data/clients/auth_provider.dart';
import '../../../support/services/session_manager.dart';
import '../bloc/auth_bloc.dart';
import '../use_cases/create_user_with_email_and_password.dart';
import '../use_cases/login_with_email_and_password.dart';

class AuthModule extends AppModule {
  @override
  void registerDependencies() {
    injector.registerFactory<AuthBloc>(
      () => AuthBloc(
        loginUserWithDocumentAndPassword: injector.get<LoginUserWithEmailAndPassword>(),
        createUserWithEmailAndPassword: injector.get<CreateUserWithEmailAndPassword>(),
        sessionManager: injector.get<SessionManager>(),
      ),
    );
    injector.registerFactory<LoginUserWithEmailAndPassword>(
      () => LoginUserWithEmailAndPasswordImpl(authProvider: injector.get<AuthProvider>()),
    );
    injector.registerFactory<CreateUserWithEmailAndPassword>(
      () => CreateUserWithEmailAndPasswordImpl(authProvider: injector.get<AuthProvider>()),
    );
  }
}
