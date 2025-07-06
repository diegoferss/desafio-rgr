import 'package:formz/formz.dart';
import 'package:rgr/support/extensions/string_extension.dart';

import '../mixins/get_error_message.dart';

enum EmailInputError with GetErrorMessage {
  empty,
  invalid;

  @override
  String getErrorMessage() {
    return switch (this) {
      empty => 'O e-mail não pode ser vazio.',
      invalid => 'O e-mail está inválido.',
    };
  }
}

class EmailInput extends FormzInput<String, EmailInputError> {
  const EmailInput.pure(super.value) : super.pure();

  const EmailInput.dirty({String value = ''}) : super.dirty(value);

  @override
  EmailInputError? validator(String value) {
    if (value.isEmpty) return EmailInputError.empty;
    if (!value.isEmailValid()) return EmailInputError.invalid;

    return null;
  }
}
