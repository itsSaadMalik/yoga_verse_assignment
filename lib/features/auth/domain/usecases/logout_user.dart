import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yoga_verse/features/auth/data/data%20sources/local_user_data_source_impl.dart';
import 'package:yoga_verse/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:yoga_verse/features/auth/domain/usecases/login_and_cache_user_data.dart';

class LogoutUserUseCase {
  final AuthRepositoryImplementation _auth;
  final LocalUserDataSourceImpl _localUserDataSourceImpl;

  LogoutUserUseCase({
    required AuthRepositoryImplementation auth,
    required LocalUserDataSourceImpl localUserDataSourceImpl,
  }) : _auth = auth,
       _localUserDataSourceImpl = localUserDataSourceImpl;

  Future<void> logoutUser() async {
    await _auth.logOutUser();
    await _localUserDataSourceImpl.clearUser();
    return;
  }
}
