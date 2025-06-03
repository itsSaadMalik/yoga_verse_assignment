class Exercise {
  final String id;
  final String title;
  final String position;
  final String? comments;
  final Duration duration;
  final double leftHandPressure;
  final double rightHandPressure;
  final double rightFootPressure;
  final double leftFootPressure;
  final String posePictureData;

  Exercise({
    required this.id,
    required this.title,
    required this.position,
    required this.duration,
    required this.leftHandPressure,
    required this.rightHandPressure,
    required this.rightFootPressure,
    required this.leftFootPressure,
    required this.posePictureData,

    this.comments,
  });
}
