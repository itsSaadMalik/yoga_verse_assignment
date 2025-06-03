import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/features/yoga_session/data/data%20source/session_init_data.dart';

final sessionInitDataSrcProvider = Provider<SessionInitData>((ref) {
  return SessionInitData();
});
