class User {
  final String name;

  final String email;
  final String uid;
  String? profileImageUrl;

  User({
    required this.name,
    required this.email,
    required this.uid,
    this.profileImageUrl,
  });
}
