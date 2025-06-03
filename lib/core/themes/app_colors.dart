import 'package:flutter/material.dart';

class AppColors {
  static Gradient get lightLinearBackground => LinearGradient(
    colors: [
      const Color.fromARGB(255, 240, 252, 248),
      const Color.fromARGB(255, 225, 255, 240),
    ],
  );
  static Gradient get secondaryLinearBackground => LinearGradient(
    colors: [const Color(0xFFBEF4CB), const Color(0xff8DDDA6)],
  );
  static Color get applightThemePrimaryColor => Color(0xFF6895AA);
}
