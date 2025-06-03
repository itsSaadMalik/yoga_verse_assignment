import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final loginStateProvider = FutureProvider<bool>((ref) async {
  ref.keepAlive();
  final pref = await SharedPreferences.getInstance();

  final loginState = pref.getBool('isLoggedIn') ?? false;
  return loginState;
});
