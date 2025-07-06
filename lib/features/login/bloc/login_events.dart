part of 'login_bloc.dart';

sealed class LoginEvents {}

class LoginFormChanged extends LoginEvents {
  final LoginForm loginForm;

  LoginFormChanged({required this.loginForm});
}

class LoginRememberPasswordChanged extends LoginEvents {}

class LoginCPFChanged extends LoginEvents {
  final String cpf;

  LoginCPFChanged({required this.cpf});
}

class LoginPasswordChanged extends LoginEvents {
  final String password;

  LoginPasswordChanged({required this.password});
}

class LoginSubmitted extends LoginEvents {}
