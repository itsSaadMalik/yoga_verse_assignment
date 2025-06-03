import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yoga_verse/core/utils/helpers/was_yesterday_helper.dart';
import 'package:yoga_verse/features/exercises/data/model/exercise_model.dart';
import 'package:yoga_verse/features/yoga_session/data/model/session_data_model.dart';
import 'package:yoga_verse/features/yoga_session/domain/data%20src/upload_session.dart';
import 'dart:developer' as d;

class UploadSessionDataSrcImpl implements UploadSessionDataSrc {
  final FirebaseFirestore firebaseFirestore;
  final String uid;
  UploadSessionDataSrcImpl({
    required this.uid,
    required this.firebaseFirestore,
  });
  @override
  Future<bool> updateStreak({required DateTime date}) async {
    try {
      final doc =
          await firebaseFirestore.collection('user_data').doc(uid).get();
      final data = doc.data();
      final lastDate =
          data?['streak_date'] != null
              ? (data?['streak_date'] as Timestamp).toDate()
              : DateTime.now();

      final newDate = lastDate.add(Duration(hours: 24)) ?? DateTime.now();

      final isAfter = date.isAfter(newDate);
      final dateWasYesterday = await wasYesterday(date: date);

      if (isAfter && dateWasYesterday) {
        await firebaseFirestore.collection('user_data').doc(uid).update({
          'streak': FieldValue.increment(1),
          'streak_date': date,
        });
      } else {
        await firebaseFirestore.collection('user_data').doc(uid).update({
          'streak_date': date,
          'streak': 1,
        });
      }

      return true;
    } catch (e) {
      d.log(e.toString());
      return false;
    }
  }

  @override
  Future<bool> updateExerciseScore({
    required List<ExerciseModel> sessionExercise,
  }) async {
    try {
      final listIds = sessionExercise.map((element) => element.id).toList();
      Map<String, int> score = {};
      for (var element in listIds) {
        score.update(element, (value) => value + 1, ifAbsent: () => 1);
      }
      final updatedMap = {
        for (var element in score.entries)
          'score.${element.key}': FieldValue.increment(element.value),
      };
      // final existingscores = await firebaseFirestore
      //     .collection('user_data')
      //     .doc(uid)
      //     .update({
      //       'score': {
      //         score.forEach((key, value) => FieldValue.increment(value)),
      //       },
      //     });

      await firebaseFirestore
          .collection('user_data')
          .doc(uid)
          .update(updatedMap);
      return true;
    } catch (e) {
      d.log(e.toString());
      return false;
    }
  }

  @override
  Future<bool> uploadSessionToDataBase({
    required List<ExerciseModel> sessionExercise,
    required Duration totalDuration,
    required DateTime date,
  }) async {
    try {
      final docRef =
          firebaseFirestore
              .collection('user_data')
              .doc(uid)
              .collection('sessions')
              .doc();
      final sessionModel = SessionDataModel(
        sessionExercise: sessionExercise,
        totalDuration: totalDuration,
        date: date,
        sessionId: docRef.id,
      );

      await docRef.set(sessionModel.toMap());
      //  updating total yoga sessions
      await firebaseFirestore.collection('user_data').doc(uid).update({
        'total_sessions': FieldValue.increment(1),
      });
      return true;
    } catch (e) {
      d.log(e.toString());
      return false;
    }
  }
}
