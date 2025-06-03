import 'package:shared_preferences/shared_preferences.dart';
import 'package:yoga_verse/features/auth/data/model/user_model.dart';
import 'package:yoga_verse/features/auth/domain/data%20sources/local_user_data_source.dart';

class LocalUserDataSourceImpl implements LocalUserDataSource {
  @override
  Future<bool> saveUser({required UserModel user}) async {
    try {
      final pref = await SharedPreferences.getInstance();
      // For state persistance ,will use this in every session
      await pref.setBool('isLoggedIn', true);

      await pref.setString('user', user.toJson);

      // await pref.setString('name', user.name);
      // await pref.setString('email', user.email);
      // await pref.setString('uid', user.uid);
      // await pref.setString(
      //   'profile_image_url',
      //   user.profileImageUrl ?? defaultImageUrl,
      // );

      return true;
    } catch (e) {
      return false;
    }
  }

  // For erasing user data
  @override
  Future<void> clearUser() async {
    try {
      final pref = await SharedPreferences.getInstance();
      await pref.clear();
    } catch (e) {
      return;
    }
  }
}
