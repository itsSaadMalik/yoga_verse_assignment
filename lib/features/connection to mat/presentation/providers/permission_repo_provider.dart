import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/features/connection%20to%20mat/data/repo/permission_repo_impl.dart';

final userDevicePermissionProvider = Provider<PermissionRepositoryImpl>((ref) {
  return PermissionRepositoryImpl();
});
