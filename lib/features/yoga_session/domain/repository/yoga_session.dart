import 'package:yoga_verse/features/exercises/data/model/exercise_model.dart';
import 'package:yoga_verse/features/exercises/domain/entity/exercise.dart';

abstract class YogaSession {
  Future<ExerciseModel> getCurrentExercise();
}
