part of 'login_bloc.dart';

enum LoginForm { login, register }

class LoginState {
  final LoginForm loginForm;
  final bool rememberPassword;
  final CPFInput cpf;
  final PasswordInput password;

  LoginState({
    this.loginForm = LoginForm.login,
    this.rememberPassword = false,
    this.cpf = const CPFInput.pure(''),
    this.password = const PasswordInput.pure(''),
  });

  LoginState copyWith({LoginForm? loginForm, bool? rememberPassword, CPFInput? cpf, PasswordInput? password}) {
    return LoginState(
      loginForm: loginForm ?? this.loginForm,
      rememberPassword: rememberPassword ?? this.rememberPassword,
      cpf: cpf ?? this.cpf,
      password: password ?? this.password,
    );
  }
}
