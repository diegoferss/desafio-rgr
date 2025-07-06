import 'package:rgr/support/extensions/string_extension.dart';

class UserDTO {
  final String email;
  final String password;

  UserDTO({required this.email, required this.password});

  bool validate() {
    final isEmailValid = email.isNotEmpty && email.isEmailValid();
    final isPasswordValid = password.isNotEmpty;

    return isEmailValid && isPasswordValid;
  }
}
