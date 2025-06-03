import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yoga_verse/features/exercises/data/model/exercise_model.dart';
import 'package:yoga_verse/features/yoga_session/domain/entity/session_data.dart';

class SessionDataModel extends SessionData {
  SessionDataModel({
    required super.sessionExercise,
    required super.totalDuration,
    required super.date,
    required super.sessionId,
  });
  factory SessionDataModel.fromFireStore(Map<String, dynamic> data) =>
      SessionDataModel(
        sessionExercise:
            (data['session_exercise'] as List<dynamic>)
                .map((e) => ExerciseModel.fromMap(e as Map<String, dynamic>))
                .toList(),
        totalDuration:
            data['total_duration'] != null
                ? Duration(seconds: data['total_duration'] as int)
                : Duration.zero,
        date:
            data['date'] != null
                ? (data['date'] as Timestamp).toDate()
                : DateTime.now(),
        sessionId: data['session_id'] ?? '',
      );

  Map<String, dynamic> toMap() => {
    'session_exercise': sessionExercise.map((e) => e.toMap()),
    'total_duration': totalDuration.inSeconds,
    'date': date,
    'session_id': sessionId,
  };
}
