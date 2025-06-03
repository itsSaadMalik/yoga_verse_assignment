class YogaMatData {
  String? exerciseName;
  String? alignment;
  // final String comments;
  final double leftHandPressure;
  final double rightHandPressure;
  final double rightFootPressure;
  final double leftFootPressure;
  DateTime? time;

  YogaMatData({
    this.exerciseName,
    this.alignment,

    required this.leftHandPressure,
    required this.rightHandPressure,
    required this.rightFootPressure,
    required this.leftFootPressure,
    this.time,
  });
}
