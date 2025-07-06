import 'package:formz/formz.dart';

import '../mixins/get_error_message.dart';

enum PasswordInputError with GetErrorMessage {
  empty;

  @override
  String getErrorMessage() {
    return switch (this) {
      empty => 'Senha não pode ser vazia',
    };
  }
}

class PasswordInput extends FormzInput<String, PasswordInputError> {
  const PasswordInput.pure(super.value) : super.pure();

  const PasswordInput.dirty({String value = ''}) : super.dirty(value);

  @override
  PasswordInputError? validator(String value) {
    if (value.isEmpty) return PasswordInputError.empty;

    return null;
  }
}
