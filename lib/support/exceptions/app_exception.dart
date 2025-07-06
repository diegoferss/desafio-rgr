import '../mixins/get_error_message.dart';

enum ErrorType with GetErrorMessage {
  loginError,
  createAccountError;

  @override
  String getErrorMessage() {
    return switch (this) {
      loginError => 'Erro ao realizar login',
      createAccountError => 'Erro ao criar conta',
    };
  }
}

class AppException implements Exception {
  final ErrorType errorType;

  AppException({required this.errorType});
}
