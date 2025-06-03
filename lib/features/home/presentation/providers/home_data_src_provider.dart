import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/features/home/data/data%20src/home_data_src_impl.dart';
import 'package:yoga_verse/injection/providers/firestore_provider.dart';

final homeScreenDataSrcProvider = Provider<HomeDataSourceImpl>((ref) {
  final fireStore = ref.read(firestoreProvider);

  return HomeDataSourceImpl(firebaseFirestore: fireStore);
});
