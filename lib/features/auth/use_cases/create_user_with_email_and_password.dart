import 'package:either_dart/either.dart';

import '../../../data/clients/auth_provider.dart';
import '../../../dto/user_dto.dart';
import '../../../support/exceptions/app_exception.dart';

abstract class CreateUserWithEmailAndPassword {
  LoginResult call(UserDTO userDTO);
}

class CreateUserWithEmailAndPasswordImpl extends CreateUserWithEmailAndPassword {
  final AuthProvider authProvider;

  CreateUserWithEmailAndPasswordImpl({required this.authProvider});

  @override
  LoginResult call(UserDTO userDTO) async {
    if (!userDTO.validate()) {
      return Left(AppException(errorType: ErrorType.createAccountError));
    }

    return await authProvider.createUserWithEmailAndPassword(userDTO);
  }
}
