import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:yoga_verse/core/shared/widgets/async_error_widget.dart';
import 'package:yoga_verse/core/shared/widgets/async_loading_widget.dart';
import 'package:yoga_verse/core/themes/app_colors.dart';
import 'package:yoga_verse/features/connection%20to%20mat/presentation/providers/current_connection_provider.dart';
import 'package:yoga_verse/features/exercises/presentation/providers/exercise_provider.dart';
import 'package:yoga_verse/features/stop%20watch/widgets/stopwatch_widget.dart';
import 'package:yoga_verse/features/yoga_session/data/data%20source/session_init_data.dart';
import 'package:yoga_verse/features/yoga_session/presentation/provider/session_data_provider.dart';
import 'package:yoga_verse/features/yoga_session/presentation/screens/widgets/exercise_controls.dart';
import 'package:yoga_verse/features/yoga_session/presentation/screens/widgets/exercise_time_elapsed_widget.dart';

class SessionDataWidget extends ConsumerWidget {
  const SessionDataWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isConnected = ref.watch(currentConnectionProvider);
    final sessionData = ref.watch(sessionDataProvider);
    final isPlaying = sessionData[SessionInitData.isPlaying] as bool;
    final allExercises = ref.watch(allExercisesProvider);
    final sessionTimeElapsed =
        sessionData[SessionInitData.timeElapsed] as Duration;
    final exercise = ref.watch(
      exerciseProvider(sessionData[SessionInitData.currentExerciseId]),
    );
    // added listner to change exercise when the time is up
    exercise.whenData(
      (value) => ref.listen(sessionDataProvider, (previous, next) {
        if (next[SessionInitData.timeElapsed] >= exercise.value!.duration) {
          debugPrint('duration over ,exercise changed');
          debugPrint(next?[SessionInitData.timeElapsed].toString());
          debugPrint(previous?[SessionInitData.timeElapsed].toString());

          ref.read(sessionDataProvider.notifier).playNextExercise();
        }
      }),
    );
    return SizedBox(
      height: 370,
      child: Stack(
        children: [
          Positioned(right: 10, child: ExerciseTimeElapsedWidget()),

          Positioned(top: 145, right: 10, left: 10, child: ExerciseControls()),
          Positioned(
            top: 90,

            left: 115,
            child: Material(
              clipBehavior: Clip.hardEdge,

              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              // margin: EdgeInsets.only(left: 10, right: 10),
              child: Container(
                // clipBehavior: Clip.hardEdge,
                height: 62,

                width: 70,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.all(e),
                  // color: Colors.white,
                  gradient: AppColors.lightLinearBackground,
                ),
              ),
            ),
          ),
          Positioned(left: 10, child: SessionStopWatch()),
        ],
      ),
    );
  }
}
