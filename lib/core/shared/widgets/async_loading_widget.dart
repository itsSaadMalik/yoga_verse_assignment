import 'package:flutter/material.dart';

class AsyncLoadingWidget extends StatelessWidget {
  const AsyncLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Column(
        children: [
          CircularProgressIndicator(color: Colors.white),
          Text('loading..'),
        ],
      ),
    );
  }
}
