import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/features/auth/presentation/provider/user_provider.dart';
import 'package:yoga_verse/features/yoga_session/domain/use%20case/upload_session_data_usecase.dart';
import 'package:yoga_verse/features/yoga_session/presentation/provider/data_src_provider.dart';
import 'package:yoga_verse/features/yoga_session/presentation/screens/widgets/save_session_pop_up.dart';
import 'package:yoga_verse/injection/providers/firestore_provider.dart';

final uploadSessionProvider = Provider<UploadSessionDataUsecase>((ref) {
  final firestore = ref.read(firestoreProvider);
  final uploadSessionDataSrc = ref.read(uploadSessionDataSrcProvider);
  final user = ref.watch(userProvider);

  return UploadSessionDataUsecase(
    firebaseFirestore: firestore,
    uploadSessionDataSrc: uploadSessionDataSrc,
    uid: user.value?.uid ?? '',
  );
});
