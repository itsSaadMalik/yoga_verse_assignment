import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/features/connection%20to%20mat/data/data%20source/connection_data_src_impl.dart';
import 'package:yoga_verse/features/connection%20to%20mat/data/repo/mat_connection_repo_impl.dart';
import 'package:yoga_verse/features/connection%20to%20mat/domain/data%20source/connection_data_src.dart';
import 'package:yoga_verse/features/connection%20to%20mat/domain/repository/mat_connection_repo.dart';
import 'package:yoga_verse/injection/providers/conncetion_data_src_injection.dart';

final matConnectionProvider = Provider<MatConnectionRepositoryImpl>((ref) {
  final dataSource = ref.watch(connectionDataSrcProvider);
  return MatConnectionRepositoryImpl(dataSource: dataSource);
});
