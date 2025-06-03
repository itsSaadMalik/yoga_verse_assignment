import 'package:shared_preferences/shared_preferences.dart';
import 'package:yoga_verse/features/auth/data/data%20sources/local_user_data_source_impl.dart';
import 'package:yoga_verse/features/auth/data/model/auth_result.dart';
import 'package:yoga_verse/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:yoga_verse/features/auth/data/repositories/user_repository_impl.dart';

class LoginAndCacheUserData {
  final AuthRepositoryImplementation _auth;
  final UserRepositoryImpl _userRepositoryImpl;
  final LocalUserDataSourceImpl _localUserDataSourceImpl;

  LoginAndCacheUserData({
    required AuthRepositoryImplementation auth,
    required UserRepositoryImpl userRepositoryImpl,
    required LocalUserDataSourceImpl localUserDataSourceImpl,
  }) : _auth = auth,
       _userRepositoryImpl = userRepositoryImpl,
       _localUserDataSourceImpl = localUserDataSourceImpl;

  Future<AuthResults> loginUser({
    required String email,
    required String pass,
  }) async {
    try {
      final uid = await _auth.loginUser(email: email, password: pass);
      // using guarded clause
      // heres uid is a obj that contain message which could be uid or error-message
      if (uid.message == null) {
        return AuthResults(isSuccess: false, message: uid.message);
      }

      final userData = await _userRepositoryImpl.fetchUserData(
        uid: uid.message ?? 'na',
      );
      if (userData == null) {
        return AuthResults(isSuccess: false);
      }
      final result = await _localUserDataSourceImpl.saveUser(user: userData);
      if (result) {
        return AuthResults(isSuccess: result, message: 'login successfully');
      }
      return AuthResults(isSuccess: false, message: 'please try again');
    } catch (e) {
      return AuthResults(isSuccess: false, message: 'some internal error');
    }
  }

  // Future<bool> loadUserData() async {
  //   try {
  //     final pref = await SharedPreferences.getInstance();
  //     final isloggedIn = await pref.getBool('isLoggedIn') ?? false;
  //     return
  //   } catch (e) {
  //     return false;
  //   }
  // }
}
