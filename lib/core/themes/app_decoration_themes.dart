import 'package:flutter/material.dart';
import 'package:yoga_verse/core/themes/app_theme.dart';

class AppDecorationThemes {
  static InputDecoration get appTextFieldTheme => InputDecoration(
    filled: true,
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 2),
      borderRadius: BorderRadius.circular(15),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 2),
      borderRadius: BorderRadius.circular(15),
    ),
    contentPadding: EdgeInsets.fromLTRB(10, 25, 10, 25),
    floatingLabelStyle: TextStyle(
      color: const Color.fromARGB(255, 255, 255, 255),
      backgroundColor:
          AppTheme
              .lightTheme
              .primaryColor, // ,const Color.fromARGB(255, 236, 236, 236),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 2),
      borderRadius: BorderRadius.circular(15),
    ),
    fillColor:
        AppTheme
            .lightTheme
            .primaryColor, // const Color.fromARGB(255, 72, 147, 190),
  );
}
