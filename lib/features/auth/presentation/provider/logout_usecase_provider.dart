import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/features/auth/domain/usecases/logout_user.dart';
import 'package:yoga_verse/injection/providers/auth_injections.dart';

final logoutUsecaseProvider = Provider<LogoutUserUseCase>((ref) {
  final auth = ref.read(authRepoProvider);

  final localUserDataSource = ref.read(localUserDataSourceProvider);
  return LogoutUserUseCase(
    auth: auth,
    localUserDataSourceImpl: localUserDataSource,
  );
});
