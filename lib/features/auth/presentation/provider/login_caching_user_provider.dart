import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/features/auth/domain/usecases/login_and_cache_user_data.dart';
import 'package:yoga_verse/injection/providers/auth_injections.dart';

final loginAndCachingUsecaseProvider = Provider<LoginAndCacheUserData>((ref) {
  final auth = ref.read(authRepoProvider);
  final userRepo = ref.read(userRepoProvider);
  final localUserDataSource = ref.read(localUserDataSourceProvider);

  return LoginAndCacheUserData(
    auth: auth,
    userRepositoryImpl: userRepo,
    localUserDataSourceImpl: localUserDataSource,
  );
});
