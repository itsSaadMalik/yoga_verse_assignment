import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yoga_verse/features/auth/data/model/user_model.dart';

final userProvider = FutureProvider<UserModel?>((ref) async {
  ref.keepAlive();
  final pref = await SharedPreferences.getInstance();
  final json = pref.getString('user');
  if (json != null) {
    final user = UserModel.fromJson(json);
    return user;
  }
  return null;
});
