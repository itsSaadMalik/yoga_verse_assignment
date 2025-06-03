import 'package:yoga_verse/features/home/domain/entity/user_home_data.dart';

abstract class HomeDataSource {
  Future<int> getCurrentStreak({required String uid});
  Future<UserHomeData?> getUserHomeData({required String uid});
  Future<int> updateCurrentStreak({required String uid});
}
