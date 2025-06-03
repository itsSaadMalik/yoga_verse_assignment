class SessionInitData {
  Map<String, dynamic> get sessionInitData => {
    'current_exercise_id': '4',
    'current_exercise_index': 3,
    'exercise_name': "Child's Pose",
    'time_elapsed': Duration.zero,
    'is_playing': false,

    'all_exercises': [
      // ?as i dont have any live data to put here ,
      //i'll put the mock simulation data itself as a feedback data of every exercise permformed ->
      //-> during session
    ],
  };

  static String currentExerciseId = 'current_exercise_id';
  static String currentExerciseIndex = 'current_exercise_index';
  static String timeElapsed = 'time_elapsed';
  static String isPlaying = 'is_playing';
  static String allExercises = 'all_exercises';
  static String exerciseName = 'exercise_name';
}
