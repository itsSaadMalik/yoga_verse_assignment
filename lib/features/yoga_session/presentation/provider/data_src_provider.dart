import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/features/auth/presentation/provider/user_provider.dart';
import 'package:yoga_verse/features/yoga_session/data/data%20source/upload_session_impl.dart';
import 'package:yoga_verse/injection/providers/firestore_provider.dart';

final uploadSessionDataSrcProvider = Provider<UploadSessionDataSrcImpl>((ref) {
  final uid = ref.read(userProvider);
  final firestore = ref.read(firestoreProvider);
  return UploadSessionDataSrcImpl(
    uid: uid.value!.uid,
    firebaseFirestore: firestore,
  );
});
