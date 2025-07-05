part of 'login_bloc.dart';

sealed class LoginEvents {}

class LoginFormChanged extends LoginEvents {
  final LoginForm loginForm;

  LoginFormChanged({required this.loginForm});
}
