import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/features/exercises/data/data%20source/exercise_data_src_impl.dart';
import 'package:yoga_verse/features/exercises/data/repo/exercise_repo_impl.dart';
import 'package:yoga_verse/injection/providers/exercise_data_src_provider.dart';

final exerciseRepoProvider = Provider<ExerciseRepositoryImpl>((ref) {
  final dataSrc = ref.read(exerciseDataSrcProvider);
  return ExerciseRepositoryImpl(exerciseDataSource: dataSrc);
});
