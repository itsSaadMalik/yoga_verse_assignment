import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yoga_verse/core/themes/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    primaryColor: Color(0xFF6895AA), // const Color.fromARGB(255, 72, 147, 190),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.black.withValues(alpha: .2),
      ),
      backgroundColor: Colors.transparent,
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.inter(
        color: Colors.white,
        fontSize: 16,
        letterSpacing: 1.3,
      ),
      bodyMedium: GoogleFonts.inter(
        color: Colors.white,
        fontSize: 16,
        letterSpacing: 1.3,
      ),
      bodySmall: GoogleFonts.inter(
        color: const Color.fromARGB(255, 26, 26, 26),
        fontSize: 13,
        // letterSpacing: 1,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          AppColors.applightThemePrimaryColor,
        ),
        foregroundColor: WidgetStatePropertyAll(Colors.white),
        elevation: WidgetStatePropertyAll(0),
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.applightThemePrimaryColor,
    ),
  );
}
