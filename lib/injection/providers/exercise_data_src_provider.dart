import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/features/exercises/data/data%20source/exercise_data_src_impl.dart';

final exerciseDataSrcProvider = Provider<ExerciseDataSourceImpl>((ref) {
  return ExerciseDataSourceImpl();
});
