import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/features/auth/presentation/provider/user_provider.dart';
import 'package:yoga_verse/features/home/presentation/providers/home_data_src_provider.dart';
import 'package:yoga_verse/features/home/presentation/providers/user_home_data_repo_provider.dart';
import 'package:yoga_verse/features/home/use%20case/user_home_data_usecase.dart';
import 'package:yoga_verse/injection/providers/firestore_provider.dart';

final homeScreenUseCaseProvider = Provider<UserHomeDataUseCase>((ref) {
  final userHomeDataRepositoryImpl = ref.read(userHomeDataRepoProvider);
  final homeDataSrc = ref.read(homeScreenDataSrcProvider);
  final userData = ref.watch(userProvider);
  return UserHomeDataUseCase(
    userHomeDataRepositoryImpl: userHomeDataRepositoryImpl,
    homeDataSourceImpl: homeDataSrc,
    uid: userData.value?.uid ?? 'no uid',
  );
});
