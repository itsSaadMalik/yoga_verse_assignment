import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yoga_verse/features/mat/domain/entity/yoga_mat_data.dart';

class YogaMatDataModel extends YogaMatData {
  YogaMatDataModel({
    super.exerciseName,
    super.alignment,
    required super.leftHandPressure,
    required super.rightHandPressure,
    required super.leftFootPressure,
    required super.rightFootPressure,
    super.time,
  });

  YogaMatData copyWith({
    String? exerciseName,
    String? alignment,
    String? comments,
    double? leftHandPressure,
    double? rightHandPressure,
    double? rightFootPressure,
    double? leftFootPressure,
    DateTime? time,
  }) => YogaMatDataModel(
    exerciseName: exerciseName ?? this.exerciseName,
    alignment: alignment ?? this.alignment,
    leftHandPressure: leftHandPressure ?? this.leftHandPressure,
    rightHandPressure: rightHandPressure ?? this.rightHandPressure,
    leftFootPressure: leftFootPressure ?? this.leftFootPressure,
    rightFootPressure: rightFootPressure ?? this.rightFootPressure,
  );

  factory YogaMatDataModel.fromMap(Map<String, dynamic> data) =>
      YogaMatDataModel(
        exerciseName: data['exercise_name'] ?? '',
        alignment: data['alignment'] ?? '',
        leftHandPressure: data['left_hand_pressure'] ?? 0,
        rightHandPressure: data['right_hand_pressure'] ?? 0,
        leftFootPressure: data['left_foot_pressure'] ?? 0,
        rightFootPressure: data['right_foot_pressure'] ?? 0,
        time:
            data['time_stamp'] != null
                ? (data['time_stamp'] as Timestamp).toDate()
                : null,
      );

  Map<String, dynamic> toMap() => {
    'exercise_name': exerciseName,
    'alignment': alignment,
    'left_hand_pressure': leftHandPressure,
    'right_hand_pressure': rightHandPressure,
    'left_foot_pressure': leftFootPressure,
    'right_foot_pressure': rightFootPressure,
    'time_stamp': time,
  };

  factory YogaMatDataModel.fromJson(String source) =>
      YogaMatDataModel.fromMap(json.decode(source));

  String get toJson => json.encode(toMap());
}
