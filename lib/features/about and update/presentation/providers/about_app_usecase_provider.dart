import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/features/about%20and%20update/domain/use%20case/app_feature_usecase.dart';
import 'package:yoga_verse/features/about%20and%20update/presentation/providers/abt_app_repo_impl_provider.dart';
import 'package:yoga_verse/injection/providers/firestore_provider.dart';

final aboutAppUsecaseProvider = Provider<AboutAppUsecase>((ref) {
  final firestore = ref.read(firestoreProvider);
  final aboutAppRepositoryImpl = ref.read(aboutAppRepositoryProvider);
  return AboutAppUsecase(
    firebaseFirestore: firestore,
    aboutAppRepositoryImpl: aboutAppRepositoryImpl,
  );
});
