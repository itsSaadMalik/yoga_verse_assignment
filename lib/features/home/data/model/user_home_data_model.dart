import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yoga_verse/features/home/domain/entity/user_home_data.dart';

class UserHomeDataModel extends UserHomeData {
  UserHomeDataModel({
    required super.streak,
    required super.totalSessions,
    required super.lastSession,
  });

  UserHomeDataModel copyWith({
    int? streak,
    int? totalSessions,
    DateTime? lastSession,
  }) => UserHomeDataModel(
    streak: streak ?? this.streak,
    totalSessions: totalSessions ?? this.totalSessions,
    lastSession: lastSession ?? this.lastSession,
  );

  factory UserHomeDataModel.fromMap(Map<String, dynamic> data) =>
      UserHomeDataModel(
        streak: data['streak'] ?? 0,
        totalSessions: data['total_sessions'] ?? 0,
        lastSession:
            data['streak_date'] != null
                ? (data['streak_date'] as Timestamp).toDate()
                : DateTime.now(),
      );
  Map<String, dynamic> toMap() => {
    'streak': streak,
    'total_sessions': totalSessions,
    'streak_date': lastSession,
  };
}
