import 'package:yoga_verse/features/auth/data/model/user_model.dart';

abstract class UserRepository {
  Future<UserModel?> fetchUserData({required String uid});
  // Future<void>
}
