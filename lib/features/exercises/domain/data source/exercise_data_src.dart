import 'package:yoga_verse/features/exercises/data/model/exercise_model.dart';

abstract class ExerciseDataSource {
  List<ExerciseModel> get getInbuiltExerises;
  int get length;

  Future<ExerciseModel?> getExercise({required String exerciseID});
}
