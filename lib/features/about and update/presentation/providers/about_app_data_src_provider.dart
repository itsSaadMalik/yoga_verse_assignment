import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/features/about%20and%20update/data/data%20src/about_app_data_src_impl.dart';
import 'package:yoga_verse/injection/providers/firestore_provider.dart';

final aboutAppDataSourceProvider = Provider<AboutAppDataSourceImpl>((ref) {
  final firestore = ref.read(firestoreProvider);

  return AboutAppDataSourceImpl(firebaseFirestore: firestore, ref: ref);
});
