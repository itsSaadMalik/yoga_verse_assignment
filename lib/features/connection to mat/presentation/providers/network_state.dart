import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/features/connection%20to%20mat/data/repo/network_state_repo_impl.dart';

final networkStateProvider = Provider<NetworkStateRepositoryImpl>((ref) {
  return NetworkStateRepositoryImpl();
});
