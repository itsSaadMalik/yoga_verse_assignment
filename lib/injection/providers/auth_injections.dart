import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/features/auth/data/data%20sources/local_user_data_source_impl.dart';
import 'package:yoga_verse/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:yoga_verse/features/auth/data/repositories/user_repository_impl.dart';
import 'package:yoga_verse/injection/providers/firebase_auth_provider.dart';
import 'package:yoga_verse/injection/providers/firestore_provider.dart';

final authRepoProvider = Provider<AuthRepositoryImplementation>((ref) {
  final firebaseAuth = ref.read(firebaseAuthProvider);
  return AuthRepositoryImplementation(firebaseAuth: firebaseAuth);
});

final userRepoProvider = Provider<UserRepositoryImpl>((ref) {
  final dataSource = ref.read(firestoreProvider);
  return UserRepositoryImpl(dataSource);
});

final localUserDataSourceProvider = Provider<LocalUserDataSourceImpl>((ref) {
  return LocalUserDataSourceImpl();
});
