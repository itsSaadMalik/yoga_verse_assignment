import 'package:uuid/uuid.dart';

class StopWatchModel {
  final Duration duration;
  final bool isRunning;
  final String id;
  StopWatchModel({required this.duration, required this.isRunning, String? id})
    : id = id ?? Uuid().v4();

  StopWatchModel copywith({Duration? duration, bool? isRunning}) =>
      StopWatchModel(
        duration: duration ?? this.duration,
        isRunning: isRunning ?? this.isRunning,
      );
  @override
  bool operator ==(covariant StopWatchModel other) => id == other.id;

  @override
  int get hashCode => id.hashCode;
}
