import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/features/app%20features/domain/use%20case/app_feature_usecase.dart';
import 'package:yoga_verse/features/app%20features/presentation/providers/appfeature_repo_impl_provider.dart';
import 'package:yoga_verse/injection/providers/firestore_provider.dart';

final appFeatureUsecaseProvider = Provider<AppFeatureUsecase>((ref) {
  final firestore = ref.read(firestoreProvider);
  final appFeatureRepo = ref.read(appFeatureRepositoryProvider);
  return AppFeatureUsecase(
    firebaseFirestore: firestore,
    appFeatureRepositoryImpl: appFeatureRepo,
  );
});
