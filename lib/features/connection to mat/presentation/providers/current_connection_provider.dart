import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/core/utils/enums/connection_type.dart';

final currentConnectionProvider = StateProvider<MatConnectionType>((ref) {
  return MatConnectionType.none;
});
