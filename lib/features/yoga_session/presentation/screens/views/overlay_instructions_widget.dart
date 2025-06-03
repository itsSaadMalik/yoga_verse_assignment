import 'package:flutter/material.dart';

class overlayInstructionsWidget extends StatelessWidget {
  const overlayInstructionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width / 1.5,
        child: Text(
          'look at the instructions below to make the most out of this session',
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(fontSize: 10.5),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
