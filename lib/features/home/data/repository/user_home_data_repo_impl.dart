import 'package:yoga_verse/features/home/domain/entity/user_home_data.dart';
import 'package:yoga_verse/features/home/domain/repository/user_home_data_repo.dart';
import 'dart:developer' as d;

class UserHomeDataRepositoryImpl implements UserHomeDataRepo {
  @override
  Future<int> updateCurrentStreak({required String uid}) {
    throw UnimplementedError();
  }

  @override
  Future<bool> wasYesterday({required DateTime date}) async {
    try {
      final now = DateTime.now();
      final lastDay = now.subtract(Duration(days: 1));

      d.log('${lastDay.day}');
      return date.day == (lastDay.day) ||
          date.isAfter(
            lastDay,
          ); //  date.isAfter(lastDay) this cjhecks if session was performed today
    } catch (e) {
      return false;
    }
  }
}
