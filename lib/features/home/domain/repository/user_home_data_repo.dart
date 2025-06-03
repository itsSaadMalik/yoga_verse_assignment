abstract class UserHomeDataRepo {
  Future<int> updateCurrentStreak({required String uid});
  Future<bool> wasYesterday({required DateTime date});
}
