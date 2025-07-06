part of 'auth_bloc.dart';

sealed class AuthEvents {}

class LoginFormChanged extends AuthEvents {
  final AuthForm loginForm;

  LoginFormChanged({required this.loginForm});
}

class LoginRememberPasswordChanged extends AuthEvents {}

class LoginCPFChanged extends AuthEvents {
  final String cpf;

  LoginCPFChanged({required this.cpf});
}

class LoginPasswordChanged extends AuthEvents {
  final String password;

  LoginPasswordChanged({required this.password});
}

class LoginConfirmPasswordChanged extends AuthEvents {
  final String confirmPassword;

  LoginConfirmPasswordChanged({required this.confirmPassword});
}

class LoginSubmitted extends AuthEvents {}
