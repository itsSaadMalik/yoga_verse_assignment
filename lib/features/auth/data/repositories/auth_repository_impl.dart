import 'package:firebase_auth/firebase_auth.dart';
import 'package:yoga_verse/features/auth/data/model/auth_result.dart';
import 'package:yoga_verse/features/auth/domain/repositories/auth_repository.dart';
import 'dart:developer' as d;

import 'package:yoga_verse/injection/providers/auth_injections.dart';

class AuthRepositoryImplementation implements AuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepositoryImplementation({required FirebaseAuth firebaseAuth})
    : _firebaseAuth = firebaseAuth;
  @override
  Future<AuthResults> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return AuthResults(isSuccess: true, message: authResult.user?.uid);
    } on FirebaseAuthException catch (e) {
      d.log(e.toString());
      if (e.message == 'invalid-credential') {
        return AuthResults(
          isSuccess: false,
          message: 'pleases enter valid credentials',
        );
      }
      return AuthResults(isSuccess: false, message: e.message);
    } catch (e) {
      return AuthResults(isSuccess: false, message: 'some internal');
    }
  }

  @override
  Future<bool> logOutUser() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }
}
