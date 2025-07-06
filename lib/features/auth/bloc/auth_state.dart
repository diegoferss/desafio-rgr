part of 'auth_bloc.dart';

enum AuthForm { login, register }

class AuthState {
  final AuthForm loginForm;
  final FormSubmissionStatus status;
  final bool rememberPassword;
  final EmailInput email;
  final PasswordInput password;
  final ConfirmPasswordInput confirmPassword;
  final ErrorType? errorType;

  AuthState({
    this.loginForm = AuthForm.login,
    this.status = FormSubmissionStatus.initial,
    this.rememberPassword = false,
    this.email = const EmailInput.pure(''),
    this.password = const PasswordInput.pure(''),
    this.confirmPassword = const ConfirmPasswordInput.pure(password: ''),
    this.errorType,
  });

  AuthState copyWith({
    AuthForm? loginForm,
    FormSubmissionStatus? status,
    bool? rememberPassword,
    EmailInput? cpf,
    PasswordInput? password,
    ConfirmPasswordInput? confirmPassword,
    ErrorType? errorType,
  }) {
    return AuthState(
      loginForm: loginForm ?? this.loginForm,
      status: status ?? this.status,
      rememberPassword: rememberPassword ?? this.rememberPassword,
      email: cpf ?? email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      errorType: errorType ?? this.errorType,
    );
  }

  bool get isFormValid {
    return Formz.validate([email, password, if (loginForm == AuthForm.register) confirmPassword]);
  }

  bool get canSubmit {
    return isFormValid && status != FormSubmissionStatus.inProgress;
  }
}
