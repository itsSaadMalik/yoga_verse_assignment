import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/core/themes/app_theme.dart';

class NoConnectionScreen extends ConsumerWidget {
  const NoConnectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        spacing: 30,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/yoga_mat_main_1.jpg',
            height: 300,
            // width: 400,
          ),
          Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(15),

            height: 200,
            decoration: BoxDecoration(
              color: AppTheme.lightTheme.primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                'Please Connect Your SmartMat with this device to get Live feed for your session',
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
