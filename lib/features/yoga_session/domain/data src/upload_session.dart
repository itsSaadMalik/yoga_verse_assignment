import 'package:yoga_verse/features/exercises/data/model/exercise_model.dart';

abstract class UploadSessionDataSrc {
  Future<bool> uploadSessionToDataBase({
    required List<ExerciseModel> sessionExercise,
    required Duration totalDuration,
    required DateTime date,
  });
  Future<bool> updateStreak({required DateTime date});
  Future<bool> updateExerciseScore({
    required List<ExerciseModel> sessionExercise,
  });
}
