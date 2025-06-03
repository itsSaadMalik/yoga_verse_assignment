import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yoga_verse/features/exercises/data/model/exercise_model.dart';

class SessionData {
  final List<ExerciseModel> sessionExercise;
  final DateTime date;
  final Duration totalDuration;
  final String sessionId;
  SessionData({
    required this.sessionExercise,
    required this.totalDuration,
    required this.date,
    required this.sessionId,
  });

  //   final String  'session_exercise';
  // final String  'total_duration';
  // final String  'date';
  // final String  'session_id';
}

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
