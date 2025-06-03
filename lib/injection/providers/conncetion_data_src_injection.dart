import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/features/connection%20to%20mat/data/data%20source/connection_data_src_impl.dart';
import 'package:yoga_verse/features/connection%20to%20mat/domain/data%20source/connection_data_src.dart';

final connectionDataSrcProvider = Provider<ConnectionDataSourceImpl>((ref) {
  return ConnectionDataSourceImpl();
});
