import 'package:yoga_verse/features/auth/data/model/user_model.dart';

abstract class LocalUserDataSource {
  Future<bool> saveUser({required UserModel user});
  Future<void> clearUser();
}
