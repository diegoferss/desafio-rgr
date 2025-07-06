part of 'login_bloc.dart';

enum LoginForm { login, register }

class LoginState {
  final LoginForm loginForm;
  final FormSubmissionStatus status;
  final bool rememberPassword;
  final EmailInput email;
  final PasswordInput password;
  final ErrorType? errorType;

  LoginState({
    this.loginForm = LoginForm.login,
    this.status = FormSubmissionStatus.initial,
    this.rememberPassword = false,
    this.email = const EmailInput.pure(''),
    this.password = const PasswordInput.pure(''),
    this.errorType,
  });

  LoginState copyWith({
    LoginForm? loginForm,
    FormSubmissionStatus? status,
    bool? rememberPassword,
    EmailInput? cpf,
    PasswordInput? password,
    ErrorType? errorType,
  }) {
    return LoginState(
      loginForm: loginForm ?? this.loginForm,
      status: status ?? this.status,
      rememberPassword: rememberPassword ?? this.rememberPassword,
      email: cpf ?? email,
      password: password ?? this.password,
      errorType: errorType ?? this.errorType,
    );
  }

  bool get isFormValid {
    return Formz.validate([email, password]);
  }

  bool get canSubmit {
    return isFormValid && status != FormSubmissionStatus.inProgress;
  }
}
