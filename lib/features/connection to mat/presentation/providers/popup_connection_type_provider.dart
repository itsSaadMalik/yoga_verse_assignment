import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/core/utils/enums/connection_type.dart';

final popUpconnetionTypeProvider = StateProvider.autoDispose<MatConnectionType>(
  (ref) {
    return MatConnectionType.none;
  },
);
