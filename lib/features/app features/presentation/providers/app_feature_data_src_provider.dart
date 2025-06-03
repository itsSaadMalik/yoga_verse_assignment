import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/features/app%20features/data/data%20src/app_feature_data_src_impl.dart';
import 'package:yoga_verse/injection/providers/firestore_provider.dart';

final appFeatureDataSourceProvider = Provider<AppFeatureDataSourceImpl>((ref) {
  final firestore = ref.read(firestoreProvider);

  return AppFeatureDataSourceImpl(firebaseFirestore: firestore);
});
