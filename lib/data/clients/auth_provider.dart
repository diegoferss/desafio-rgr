import 'dart:async';

import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:rgr/support/exceptions/app_exception.dart';

import '../../adapters/user_adapter.dart';
import '../../dto/user_dto.dart';
import '../../models/user.dart';

typedef LoginResult = FutureOr<Either<AppException, User>>;

abstract class AuthProvider {
  LoginResult loginUserWithDocumentAndPassword(UserDTO userDTO);
  LoginResult createUserWithEmailAndPassword(UserDTO userDTO);
}

class FirebaseAuthProvider implements AuthProvider {
  final firebaseAuth = FirebaseAuth.instance;

  @override
  LoginResult loginUserWithDocumentAndPassword(UserDTO userDTO) async {
    try {
      final userCredentials = await firebaseAuth.signInWithEmailAndPassword(
        email: userDTO.email,
        password: userDTO.password,
      );

      final user = UserAdapter.firebaseUserCredentialToUser(userCredentials);

      if (user == null) {
        return Left(AppException(errorType: ErrorType.loginError));
      }

      return Right(user);
    } on FirebaseAuthException catch (_) {
      return Left(AppException(errorType: ErrorType.loginError));
    }
  }

  @override
  LoginResult createUserWithEmailAndPassword(UserDTO userDTO) async {
    try {
      final userCredentials = await firebaseAuth.createUserWithEmailAndPassword(
        email: userDTO.email,
        password: userDTO.password,
      );

      final user = UserAdapter.firebaseUserCredentialToUser(userCredentials);

      if (user == null) {
        return Left(AppException(errorType: ErrorType.createAccountError));
      }

      return Right(user);
    } on FirebaseAuthException catch (_) {
      return Left(AppException(errorType: ErrorType.createAccountError));
    }
  }
}
