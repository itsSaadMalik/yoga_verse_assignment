import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> errorHandingSnackBar({
  required BuildContext context,
  String? errorMessage,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        errorMessage ?? 'Some error occured',
        style: TextStyle(color: Colors.black, fontSize: 13),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.white,
      margin: EdgeInsets.fromLTRB(12, 0, 12, 12),
      showCloseIcon: true,
      closeIconColor: const Color.fromARGB(255, 88, 88, 88),
    ),
  );
}
