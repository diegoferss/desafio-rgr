import 'package:firebase_auth/firebase_auth.dart' hide User;

import '../models/user.dart';

class UserAdapter {
  UserAdapter._();

  static User? firebaseUserCredentialToUser(UserCredential credential) {
    final user = credential.user;

    if (user == null) return null;

    return User(id: user.uid, name: user.displayName ?? '', document: user.email ?? '');
  }
}
