import 'package:flutter/widgets.dart';
import 'package:yoga_verse/features/home/data/data%20src/home_data_src_impl.dart';
import 'package:yoga_verse/features/home/data/model/user_home_data_model.dart';
import 'package:yoga_verse/features/home/data/repository/user_home_data_repo_impl.dart';
import 'package:yoga_verse/features/home/domain/repository/user_home_data_repo.dart';
import 'dart:developer' as d;

class UserHomeDataUseCase {
  final UserHomeDataRepositoryImpl userHomeDataRepositoryImpl;
  final HomeDataSourceImpl homeDataSourceImpl;
  final String uid;
  UserHomeDataUseCase({
    required this.userHomeDataRepositoryImpl,
    required this.homeDataSourceImpl,
    required this.uid,
  });

  UserHomeDataModel emptyHomeData = UserHomeDataModel(
    streak: 0,
    totalSessions: 0,
    lastSession: DateTime.now(),
  );

  Future<UserHomeDataModel?> getHomeScreenData() async {
    // this method check whether the streak is continuous and send appropriate data after correct modification 'if required'

    try {
      final homeScreenData = await homeDataSourceImpl.getUserHomeData(uid: uid);
      if (homeScreenData == null) return emptyHomeData;
      final isStreakContinous = await userHomeDataRepositoryImpl.wasYesterday(
        date: homeScreenData.lastSession,
      );

      return isStreakContinous
          ? homeScreenData
          : homeScreenData.copyWith(streak: 0);
    } catch (e) {
      d.log(e.toString());
      return null;
    }
  }
}
