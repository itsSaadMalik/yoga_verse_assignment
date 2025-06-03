import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/core/themes/app_colors.dart';
import 'package:yoga_verse/core/themes/app_theme.dart';

Future<void> simpleLoadingDailog({
  required BuildContext context,
  bool isDismissable = false,
}) async {
  showDialog(
    barrierDismissible: isDismissable,
    context: context,
    barrierColor: const Color.fromARGB(255, 22, 22, 22).withValues(alpha: .08),
    builder:
        (context) => AlertDialog(
          elevation: 0,
          surfaceTintColor: Colors.white,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.white.withValues(alpha: .4),
          alignment: Alignment.center,
          actionsAlignment: MainAxisAlignment.center,
          actions: [Text('Please wait ..')],
          content: SizedBox(
            height: 150,
            width: 30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: AppTheme.lightTheme.primaryColor,
                ),
              ],
            ),
          ),
        ),
  );
}
