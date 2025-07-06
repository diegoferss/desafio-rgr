import 'package:rgr/support/services/injector/app_module.dart';
import 'package:rgr/support/services/injector/injector.dart';

import '../../../data/clients/auth_provider.dart';
import '../bloc/login_bloc.dart';
import '../use_cases/create_user_with_email_and_password.dart';
import '../use_cases/login_with_document_and_password.dart';

class LoginModule extends AppModule {
  @override
  void registerDependencies() {
    injector.registerFactory<LoginBloc>(
      () => LoginBloc(
        loginUserWithDocumentAndPassword: injector.get<LoginUserWithDocumentAndPassword>(),
        createUserWithEmailAndPassword: injector.get<CreateUserWithEmailAndPassword>(),
      ),
    );
    injector.registerFactory<LoginUserWithDocumentAndPassword>(
      () => LoginUserWithDocumentAndPasswordImpl(authProvider: injector.get<AuthProvider>()),
    );
    injector.registerFactory<CreateUserWithEmailAndPassword>(
      () => CreateUserWithEmailAndPasswordImpl(authProvider: injector.get<AuthProvider>()),
    );
  }
}
