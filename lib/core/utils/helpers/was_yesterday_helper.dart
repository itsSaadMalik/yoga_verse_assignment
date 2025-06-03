Future<bool> wasYesterday({required DateTime date}) async {
  try {
    final now = DateTime.now();
    final lastDay = now.subtract(Duration(days: 1));

    // d.log('${lastDay.day}');
    return date.day == (lastDay.day) ||
        date.isAfter(
          lastDay,
        ); //  date.isAfter(lastDay) this cjhecks if session was performed today
  } catch (e) {
    return false;
  }
}
