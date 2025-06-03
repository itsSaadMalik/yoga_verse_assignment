import 'package:yoga_verse/features/auth/data/model/auth_result.dart';
import 'package:yoga_verse/features/auth/data/model/user_model.dart';

abstract class AuthRepository {
  Future<AuthResults> loginUser({
    required String email,
    required String password,
  });
  Future<bool> logOutUser();
}
