import 'package:formz/formz.dart';

import '../mixins/get_error_message.dart';

enum ConfirmPasswordInputError with GetErrorMessage {
  empty,
  invalid;

  @override
  String getErrorMessage() {
    return switch (this) {
      empty => 'A senha não pode ser vazia.',
      invalid => 'As senhas não coincidem',
    };
  }
}

class ConfirmPasswordInput extends FormzInput<String, ConfirmPasswordInputError> {
  final String? password;

  const ConfirmPasswordInput.pure({required this.password}) : super.pure('');

  const ConfirmPasswordInput.dirty({this.password, String value = ''}) : super.dirty(value);

  @override
  ConfirmPasswordInputError? validator(String value) {
    if (value.isEmpty) return ConfirmPasswordInputError.empty;
    if (value != password) return ConfirmPasswordInputError.invalid;

    return null;
  }
}
