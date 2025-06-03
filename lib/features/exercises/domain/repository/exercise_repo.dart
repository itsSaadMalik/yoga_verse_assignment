import 'package:yoga_verse/features/exercises/data/model/exercise_model.dart';

abstract class ExerciseRepository {
  Future<ExerciseModel?> getExercise({required String exerciseID});
  // ExerciseModel? getExercise({required String exerciseID});

  Future<List<ExerciseModel>> get getAllInbuiltExercises;
  int get getExerciseListLength;
}
