import 'package:either_dart/either.dart';

import '../../../data/clients/auth_provider.dart';
import '../../../dto/user_dto.dart';
import '../../../support/exceptions/app_exception.dart';

abstract class LoginUserWithDocumentAndPassword {
  LoginResult call(UserDTO userDTO);
}

class LoginUserWithDocumentAndPasswordImpl extends LoginUserWithDocumentAndPassword {
  final AuthProvider authProvider;

  LoginUserWithDocumentAndPasswordImpl({required this.authProvider});

  @override
  LoginResult call(UserDTO userDTO) async {
    if (!userDTO.validate()) {
      return Left(AppException(errorType: ErrorType.loginError));
    }

    return await authProvider.loginUserWithDocumentAndPassword(userDTO);
  }
}
