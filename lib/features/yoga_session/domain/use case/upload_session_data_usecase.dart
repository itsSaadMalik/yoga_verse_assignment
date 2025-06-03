import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yoga_verse/core/utils/helpers/was_yesterday_helper.dart';
import 'package:yoga_verse/features/exercises/data/model/exercise_model.dart';
import 'package:yoga_verse/features/yoga_session/data/data%20source/upload_session_impl.dart';
import 'dart:developer' as d;

import 'package:yoga_verse/features/yoga_session/domain/data%20src/upload_session.dart';

class UploadSessionDataUsecase {
  final FirebaseFirestore firebaseFirestore;
  final UploadSessionDataSrcImpl uploadSessionDataSrc;
  final String uid;
  UploadSessionDataUsecase({
    required this.firebaseFirestore,
    required this.uploadSessionDataSrc,
    required this.uid,
  });
  Future<bool> uploadSessionData({
    required List<ExerciseModel> sessionExercise,
    required Duration totalDuration,
  }) async {
    try {
      final result = await UploadSessionDataSrcImpl(
        uid: uid,
        firebaseFirestore: firebaseFirestore,
      ).uploadSessionToDataBase(
        sessionExercise: sessionExercise,
        totalDuration: totalDuration,
        date: DateTime.now(),
      );

      return result;
    } catch (e) {
      d.log('caught:${e.toString()}');
      return false;
    }
  }

  Future<bool> updateExerciseScore({
    required List<ExerciseModel> sessionExercise,
  }) async {
    try {
      final result = await uploadSessionDataSrc.updateExerciseScore(
        sessionExercise: sessionExercise,
      );
      return result;
    } catch (e) {
      d.log(e.toString());
      return false;
    }
  }

  Future<bool> updateStreak({required DateTime date}) async {
    try {
      final result = await uploadSessionDataSrc.updateStreak(date: date);
      return result;
    } catch (e) {
      d.log(e.toString());
      return false;
    }
  }
}
