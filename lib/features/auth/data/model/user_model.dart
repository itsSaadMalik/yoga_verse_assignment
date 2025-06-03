import 'dart:convert';

import 'package:yoga_verse/features/auth/domain/entity/user_entity.dart';

String defaultImageUrl =
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIf4R5qPKHPNMyAqV-FjS_OTBB8pfUV29Phg&s';

class UserModel extends User {
  UserModel({
    required super.name,
    required super.email,
    required super.uid,
    super.profileImageUrl,
  });
  factory UserModel.fromMap(Map<String, dynamic> data) => UserModel(
    name: data['user_name'] ?? '',
    email: data['user_email'] ?? '',
    uid: data['uid'] ?? '',
    profileImageUrl: data['profile_image_url'] ?? defaultImageUrl,
  );
  Map<String, dynamic> toMap() => {
    'user_name': name,
    'user_email': email,
    'uid': uid,
    'profile_image_url': profileImageUrl,
  };
  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(jsonDecode(source));
  String get toJson => jsonEncode(toMap());

  @override
  bool operator ==(covariant UserModel other) => uid == other.uid;

  @override
  int get hashCode => uid.hashCode;
}
