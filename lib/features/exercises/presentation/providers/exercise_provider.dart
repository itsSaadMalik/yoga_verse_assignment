import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/features/exercises/data/model/exercise_model.dart';
import 'package:yoga_verse/features/exercises/presentation/providers/exercise_repo_provider.dart';

final exerciseProvider = FutureProvider.family<ExerciseModel?, String>((
  ref,
  String exerciseId,
) async {
  final exerciseRepo = ref.read(exerciseRepoProvider);
  return await exerciseRepo.getExercise(exerciseID: exerciseId);
});

final allExercisesProvider = FutureProvider<List<ExerciseModel>>((ref) async {
  final exerciseRepo = ref.read(exerciseRepoProvider);
  return await exerciseRepo.getAllInbuiltExercises;
});
