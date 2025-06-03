import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:yoga_verse/core/shared/widgets/async_error_widget.dart';
import 'package:yoga_verse/core/themes/app_theme.dart';
import 'package:yoga_verse/features/exercises/presentation/providers/exercise_provider.dart';
import 'package:yoga_verse/features/yoga_session/data/data%20source/session_init_data.dart';
import 'package:yoga_verse/features/yoga_session/presentation/provider/session_data_provider.dart';

class ExerciseTimeElapsedWidget extends ConsumerWidget {
  const ExerciseTimeElapsedWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionData = ref.watch(sessionDataProvider);
    final sessionTimeElapsed =
        sessionData[SessionInitData.timeElapsed] as Duration;
    final exercise = ref.watch(
      exerciseProvider(sessionData[SessionInitData.currentExerciseId]),
    );

    return Container(
      height: 165,

      width: 175,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppTheme.lightTheme.primaryColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Time elapsed',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Center(
            child: Text(
              sessionTimeElapsed.toString().substring(2, 10),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 0, 15, 0),
            child: exercise.when(
              data: (data) {
                // debugPrint(
                //   sessionData[SessionInitData.timeElapsed].toString(),
                // );
                final sessionTimeElapsed =
                    sessionData[SessionInitData.timeElapsed] as Duration;
                final timeElapsed =
                    sessionTimeElapsed.inMilliseconds /
                    data!.duration.inMilliseconds;
                return LinearProgressIndicator(
                  borderRadius: BorderRadius.circular(1),
                  backgroundColor: Colors.black,
                  value: timeElapsed,
                  color: Colors.white,
                );
              },
              error: (error, stackTrace) => AsyncErrorWidget(),
              loading: () => Skeletonizer(child: LinearProgressIndicator()),
            ),
          ),
        ],
      ),
    );
  }
}
