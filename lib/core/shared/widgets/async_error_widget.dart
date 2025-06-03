import 'package:flutter/material.dart';
import 'dart:developer' as d;

class AsyncErrorWidget extends StatelessWidget {
  AsyncErrorWidget({super.key, this.text, this.error});
  String? text;
  String? error;

  @override
  Widget build(BuildContext context) {
    d.log(error.toString());
    return Container(
      child: Row(
        children: [
          Icon(Icons.cloud_off_rounded),
          Expanded(child: Text(text ?? 'Something went wrong')),
        ],
      ),
    );
  }
}
