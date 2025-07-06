import 'package:formz/formz.dart';

import '../mixins/get_error_message.dart';

enum CPFInputError with GetErrorMessage {
  empty;

  @override
  String getErrorMessage() {
    return switch (this) {
      empty => 'CPF não pode ser vazio',
    };
  }
}

class CPFInput extends FormzInput<String, CPFInputError> {
  const CPFInput.pure(super.value) : super.pure();

  const CPFInput.dirty({String value = ''}) : super.dirty(value);

  @override
  CPFInputError? validator(String value) {
    if (value.isEmpty) return CPFInputError.empty;

    return null;
  }
}
