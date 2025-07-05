part of 'login_bloc.dart';

enum LoginForm { login, register }

class LoginState {
  final LoginForm loginForm;

  LoginState({this.loginForm = LoginForm.login});

  LoginState copyWith({LoginForm? loginForm}) {
    return LoginState(loginForm: loginForm ?? this.loginForm);
  }
}
