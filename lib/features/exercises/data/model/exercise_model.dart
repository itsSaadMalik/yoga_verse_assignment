import 'package:yoga_verse/core/utils/helpers/pressure_string_representations.dart';
import 'package:yoga_verse/features/exercises/domain/entity/exercise.dart';

class ExerciseModel extends Exercise {
  ExerciseModel({
    required super.id,
    required super.title,
    required super.position,
    required super.duration,
    required super.leftHandPressure,
    required super.rightHandPressure,
    required super.rightFootPressure,
    required super.leftFootPressure,

    required super.posePictureData,
    super.comments,
  });

  ExerciseModel copyWith({
    String? id,
    String? title,
    String? alignment,
    String? position,
    String? comments,
    double? leftHandPressure,
    double? rightHandPressure,
    double? rightFootPressure,
    double? leftFootPressure,
    Duration? duration,
  }) => ExerciseModel(
    id: id ?? this.id,
    title: title ?? this.title,
    position: position ?? this.position,
    duration: duration ?? this.duration,
    leftHandPressure: leftHandPressure ?? this.leftHandPressure,
    rightHandPressure: rightHandPressure ?? this.rightHandPressure,
    rightFootPressure: rightFootPressure ?? this.rightFootPressure,
    leftFootPressure: leftFootPressure ?? this.leftFootPressure,
    comments: comments ?? super.comments,
    posePictureData: posePictureData,
  );

  factory ExerciseModel.fromMap(Map<String, dynamic> data) => ExerciseModel(
    id: data['id'] ?? '',
    title: data['title'] ?? '',
    position: data['position'] ?? '',
    duration:
        data['duration'] != null
            ? Duration(seconds: (data['duration'] as int))
            : Duration.zero,
    leftHandPressure: data[PressureStringRepresentations.leftHandPressure] ?? 0,
    rightHandPressure:
        data[PressureStringRepresentations.rightHandPressure] ?? 0,
    rightFootPressure:
        data[PressureStringRepresentations.leftFootPressure] ?? 0,
    leftFootPressure:
        data[PressureStringRepresentations.rightFootPressure] ?? 0,
    posePictureData: data['pose_picture_data'] ?? '',
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'title': title,
    'position': position,
    'duration': duration.inSeconds,
    PressureStringRepresentations.leftHandPressure: leftHandPressure,
    PressureStringRepresentations.rightHandPressure: rightHandPressure,
    PressureStringRepresentations.leftFootPressure: leftFootPressure,
    PressureStringRepresentations.rightFootPressure: rightFootPressure,
    'pose_picture_data': posePictureData,
  };
  @override
  bool operator ==(covariant ExerciseModel other) => id == other.id;

  @override
  int get hashCode => id.hashCode;
}
