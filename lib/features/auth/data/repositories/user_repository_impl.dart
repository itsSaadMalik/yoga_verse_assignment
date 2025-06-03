import 'package:yoga_verse/features/auth/data/model/user_model.dart';
import 'package:yoga_verse/features/auth/domain/repositories/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseFirestore _firestore;

  UserRepositoryImpl(this._firestore);

  @override
  Future<UserModel?> fetchUserData({required String uid}) async {
    try {
      final data = await _firestore.collection('users').doc(uid).get();

      return UserModel.fromMap(data.data() ?? {});
    } catch (e) {
      return null;
    }
  }
}
