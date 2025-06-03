import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/features/connection%20to%20mat/presentation/providers/current_connection_provider.dart';
import 'package:yoga_verse/features/exercises/presentation/providers/exercise_repo_provider.dart';
import 'package:yoga_verse/features/exercises/presentation/providers/exercise_provider.dart';
import 'package:yoga_verse/features/mat/data/model/data_observation_model.dart';
import 'package:yoga_verse/features/mat/presentation/position_model.dart';
import 'package:yoga_verse/features/mat/presentation/providers/simulation_data_provider.dart';
import 'package:yoga_verse/features/mat/presentation/widgets/alignment_feedback_widget.dart';
import 'package:yoga_verse/features/yoga_session/data/data%20source/session_init_data.dart';
import 'package:yoga_verse/features/yoga_session/presentation/provider/session_data_provider.dart';

class MatWidget extends ConsumerStatefulWidget {
  const MatWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MatWidgetState();
}

class _MatWidgetState extends ConsumerState<MatWidget> {
  @override
  Widget build(BuildContext context) {
    //provides the info for current session
    final sessionData = ref.watch(sessionDataProvider);
    // check wether session is still palying
    final isPlaying = sessionData[SessionInitData.isPlaying] as bool;

    // fetches the appropriate exercise to the ui
    final curerntExercise = ref.watch(
      exerciseProvider(sessionData[SessionInitData.currentExerciseId]),
    );

    // this fetches the mock data for simluation of mat Type:YogaMatData
    final matData = ref.watch(simulationDataProvider);
    // ref.listen(sessionDataProvider, (previous, next) {
    //   next[SessionInitData.isPlaying] as bool
    //       ? ref.read(simulationDataProvider.notifier).activate()
    //       : ref.read(simulationDataProvider.notifier).deactivate();
    // });
    return SizedBox(
      height: 500,
      child: curerntExercise.when(
        data:
            (data) =>
                data != null
                    ? Stack(
                      alignment: Alignment.center,
                      // fit: StackFit.loose,
                      children: [
                        Align(
                          // alignment: Alignment.center,
                          child: Material(
                            borderRadius: BorderRadius.circular(5),
                            clipBehavior: Clip.hardEdge,
                            child: Image.asset(
                              'assets/images/yoga_mat_main_1.jpg',
                              height: 350,
                              // width: 130,
                            ),
                          ),
                        ),

                        AlignmentFeedbackWidget(
                          observationData: MatDataObservationModel(
                            expectedExerciseData: data.leftHandPressure,
                            observedMatData: matData.leftHandPressure,
                            matArea: 'Left Hand',
                          ),
                          iconName: 'left_hand',
                          textWidgetPosition: PositionModel(left: 10, top: 130),
                          limbsFeedbackPosition: PositionModel(
                            left: 135,
                            top: 125,
                          ),
                        ),

                        AlignmentFeedbackWidget(
                          limbsFeedbackPosition: PositionModel(
                            right: 135,
                            top: 125,
                          ),
                          observationData: MatDataObservationModel(
                            expectedExerciseData: data.rightHandPressure,
                            observedMatData: matData.rightHandPressure,
                            matArea: 'Right Hand',
                          ),
                          iconName: 'right_hand',
                          textWidgetPosition: PositionModel(
                            right: 10,
                            top: 130,
                          ),
                        ),

                        AlignmentFeedbackWidget(
                          limbsFeedbackPosition: PositionModel(
                            right: 135,
                            bottom: 125,
                          ),
                          observationData: MatDataObservationModel(
                            expectedExerciseData: data.rightFootPressure,
                            observedMatData: matData.rightFootPressure,
                            matArea: 'Right Foot',
                          ),
                          iconName: 'right_foot',
                          textWidgetPosition: PositionModel(
                            right: 10,
                            bottom: 130,
                          ),
                        ),
                        AlignmentFeedbackWidget(
                          limbsFeedbackPosition: PositionModel(
                            left: 135,
                            bottom: 125,
                          ),
                          observationData: MatDataObservationModel(
                            expectedExerciseData: data.leftFootPressure,
                            observedMatData: matData.leftFootPressure,
                            matArea: 'Left Foot',
                          ),
                          iconName: 'left_foot',
                          textWidgetPosition: PositionModel(
                            left: 10,
                            bottom: 130,
                          ),
                        ),
                      ],
                    )
                    : Center(
                      child: Text(
                        'please start the session to get a live feed of your SmartMat',
                      ),
                    ),

        error: (error, stackTrace) => Center(child: Text(error.toString())),
        loading: () => Center(child: Text('loading exercise')),
      ),
    );
  }
}

                        // Positioned(
                        //   top: 0,
                        //   child: ElevatedButton(
                        //     onPressed: () {
                        //       ref
                        //           .read(sessionDataProvider.notifier)
                        //           .startExercise();
                        //       ref
                        //           .read(simulationDataProvider.notifier)
                        //           .activate();
                        //     },
                        //     child: Text('start session'),
                        //   ),
                        // ),
                        // Positioned(
                        //   top: 45,
                        //   child: ElevatedButton(
                        //     onPressed: () {
                        //       ref
                        //           .read(sessionDataProvider.notifier)
                        //           .stopExercise();
                        //       ref
                        //           .read(simulationDataProvider.notifier)
                        //           .deactivate();
                        //     },
                        //     child: Text('stop session'),
                        //   ),
                        // ),