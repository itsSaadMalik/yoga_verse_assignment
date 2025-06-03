import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/features/connection%20to%20mat/data/repo/mat_connection_repo_impl.dart';
import 'package:yoga_verse/features/connection%20to%20mat/data/repo/permission_repo_impl.dart';
import 'package:yoga_verse/features/connection%20to%20mat/domain/data%20source/connection_data_src.dart';
import 'package:yoga_verse/features/connection%20to%20mat/presentation/providers/mat_connection_provider.dart';
import 'package:yoga_verse/features/connection%20to%20mat/presentation/providers/permission_repo_provider.dart';
import 'package:yoga_verse/features/home/use%20case/connect_to_mat.dart';

final connectToMatProvider = Provider<ConnectToMatUseCase>((ref) {
  final PermissionRepositoryImpl permissionRepositoryImpl = ref.watch(
    userDevicePermissionProvider,
  );
  final MatConnectionRepositoryImpl matConnectionRepositoryImpl = ref.watch(
    matConnectionProvider,
  );
  return ConnectToMatUseCase(
    permissionRepositoryImpl: permissionRepositoryImpl,
    matConnectionRepositoryImpl: matConnectionRepositoryImpl,
  );
});
