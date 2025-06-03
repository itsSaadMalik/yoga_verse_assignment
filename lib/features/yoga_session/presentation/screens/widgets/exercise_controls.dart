import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/core/shared/widgets/async_error_widget.dart';
import 'package:yoga_verse/core/shared/widgets/async_loading_widget.dart';
import 'package:yoga_verse/core/themes/app_theme.dart';
import 'package:yoga_verse/features/exercises/presentation/providers/exercise_provider.dart';
import 'package:yoga_verse/features/yoga_session/data/data%20source/session_init_data.dart';
import 'package:yoga_verse/features/yoga_session/presentation/provider/session_data_provider.dart';

class ExerciseControls extends ConsumerWidget {
  const ExerciseControls({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionData = ref.watch(sessionDataProvider);

    final isPlaying = sessionData[SessionInitData.isPlaying] as bool;
    final allExercises = ref.watch(allExercisesProvider);
    final sessionTimeElapsed =
        sessionData[SessionInitData.timeElapsed] as Duration;
    return Container(
      alignment: Alignment.topLeft,

      height: 185,
      width: MediaQuery.sizeOf(context).width,
      padding: EdgeInsets.fromLTRB(15, 18, 10, 15),
      decoration: BoxDecoration(
        color: AppTheme.lightTheme.primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Text(
            sessionData[SessionInitData.exerciseName],
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              // color: Colors.black,
            ),
          ),
          Positioned(
            bottom: 15,
            left: 10,
            child: SizedBox(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      ref
                          .read(sessionDataProvider.notifier)
                          .playPreviousExercise();
                    },
                    icon: Icon(Icons.skip_previous_rounded),
                    color: Colors.black,
                  ),
                  InkWell(
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.white,
                      child: Icon(
                        isPlaying
                            ? Icons.pause_rounded
                            : Icons.play_arrow_rounded,
                        color: Colors.black,
                        size: 26,
                      ),
                    ),
                    onTap: () {
                      isPlaying
                          ? ref
                              .read(sessionDataProvider.notifier)
                              .stopExercise()
                          : ref
                              .read(sessionDataProvider.notifier)
                              .startExercise();
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.skip_next_rounded),
                    color: Colors.black,
                    onPressed: () {
                      ref.read(sessionDataProvider.notifier).playNextExercise();
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            // left: 170,
            right: 10,
            // alignment: Alignment.centerRight,
            child: allExercises.when(
              data:
                  (data) => Container(
                    margin: EdgeInsets.only(top: 0),
                    width: 120,
                    height: 120,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final exercise = data.elementAt(index);
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            '${index + 1}. ${exercise.title}',
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall?.copyWith(
                              color:
                                  index ==
                                          sessionData[SessionInitData
                                              .currentExerciseIndex]
                                      ? Colors.black
                                      : Colors.white,
                              fontSize: 13.5,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

              error: (error, stackTrace) => AsyncErrorWidget(),
              loading: () => AsyncLoadingWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
