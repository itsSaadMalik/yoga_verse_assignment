import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/features/home/data/repository/user_home_data_repo_impl.dart';

final userHomeDataRepoProvider = Provider<UserHomeDataRepositoryImpl>((ref) {
  return UserHomeDataRepositoryImpl();
});
