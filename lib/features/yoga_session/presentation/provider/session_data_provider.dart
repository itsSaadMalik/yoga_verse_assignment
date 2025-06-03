import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/core/utils/enums/connection_type.dart';
import 'package:yoga_verse/features/connection%20to%20mat/presentation/providers/current_connection_provider.dart';
import 'package:yoga_verse/features/exercises/data/model/exercise_model.dart';
import 'package:yoga_verse/features/exercises/presentation/providers/exercise_repo_provider.dart';
import 'package:yoga_verse/features/mat/presentation/providers/simulation_data_provider.dart';
import 'package:yoga_verse/features/stop%20watch/model/stop_watch.dart';
import 'package:yoga_verse/features/stop%20watch/providers/stop_watch_provider.dart';
import 'package:yoga_verse/features/yoga_session/data/data%20source/session_init_data.dart';
import 'package:yoga_verse/features/yoga_session/presentation/provider/session_init_data_src_provider.dart';
import 'dart:developer' as d;

import 'package:yoga_verse/injection/providers/exercise_data_src_provider.dart';

class SessionDataNotifier extends StateNotifier<Map<String, dynamic>> {
  String stopWatchId = 'session_watch';
  Ref ref;
  // we need this obj to provide data to other parts of the notifier
  late StopWatchModel stopWatch;
  SessionDataNotifier(super._state, this.ref) {
    final isConnected =
        ref.watch(currentConnectionProvider) != MatConnectionType.none;
    if (isConnected && mounted) {
      state[SessionInitData.isPlaying] = true;
      initStopWatch();
      ref.read(simulationDataProvider.notifier).activate();
    }
  }
  void initStopWatch() {
    ref.listen(stopWatchProvider(stopWatchId), (previous, next) {
      stopWatch = next;
      state[SessionInitData.timeElapsed] = next.duration;

      state = {...state};
    });
  }

  // ?this is mostly start and stop the stopwatch as of now in this mock simulation
  void startExercise() {
    if (!mounted) {
      return;
    }
    final stopwatchAlive =
        ref.read(stopWatchProvider(stopWatchId).notifier).mounted;
    if (!stopwatchAlive) {
      d.log('stopwatch isnt mounted ');
      return;
    }

    {
      // start the Stopwatch

      ref.read(stopWatchProvider(stopWatchId).notifier).start();

      // start the Simulation
      ref.read(simulationDataProvider.notifier).activate();

      state[SessionInitData.timeElapsed] = stopWatch.duration;
      state[SessionInitData.isPlaying] = true;
    }

    state = {...state};
  }

  void stopExercise() {
    if (!mounted) return;

    final stopwatchAlive =
        ref.read(stopWatchProvider(stopWatchId).notifier).mounted;
    if (!stopwatchAlive) {
      d.log('stopwatch isnt mounted ');
      return;
    }
    // stop the Stopwatch

    ref.read(stopWatchProvider(stopWatchId).notifier).stop();

    // stop the Simulation

    ref.read(simulationDataProvider.notifier).deactivate();
    state[SessionInitData.isPlaying] = false;
    state = {...state};
  }

  void startSession() {
    ref.read(stopWatchProvider(stopWatchId).notifier).start();
    ref.read(simulationDataProvider.notifier).activate();
    state[SessionInitData.isPlaying] = true;
    state = {...state};
  }

  //upload session data to the database to be viewed later by user (add-on feature😉)
  void terminateSession() {
    // will use repos for that
    state = {...state};
  }

  void updateSessionExerciseRecord({
    required String exerciseId,
    required Duration udpateDuration,
  }) async {
    // this methods updates the records for this session which states what-all exercises user performed and thier durations
    // here will just put duration as a real live data since we are just using simulation we can put the mock exercise data itself in here
    var existingData =
        (state[SessionInitData.allExercises] as List<dynamic>)
            .map((e) => e as ExerciseModel)
            .toList();
    final currentExerciseID = state[SessionInitData.currentExerciseId];
    final newData = await ref
        .read(exerciseRepoProvider)
        .getExercise(exerciseID: currentExerciseID as String);

    //as of now i am not updating the duration just adding all the exercises along with thier durations

    existingData.add(newData!.copyWith(duration: stopWatch.duration));
    // replaces the existiing list with new One
    if (!mounted) {
      d.log('the context is Not scope updateSession ExerciseRecords');
      return;
    }
    if (mounted) {
      state[SessionInitData.allExercises] = existingData;
      d.log('the context is in scope updateSession ExerciseRecords');
      state = {...state};
    }
  }

  void playNextExercise() async {
    updateSessionExerciseRecord(
      exerciseId: state[SessionInitData.currentExerciseId],
      udpateDuration: stopWatch.duration,
    );

    final currentExerciseIndex =
        state[SessionInitData.currentExerciseIndex] as int;

    final allExercises = ref.read(exerciseDataSrcProvider).getInbuiltExerises;
    final length = allExercises.length;

    // Using a neat DSA trick i learned => lets u treat 1d Array like a circular array
    final nextIndex = (currentExerciseIndex + 1) % length;
    updateSessionExerciseData(nextIndex: nextIndex);
    if (!mounted) {
      d.log('the context  not scope');

      return;
    }
    if (mounted) {
      d.log('the context is in scope state is updated');
      state = {...state};
    }
  }

  void playPreviousExercise() {
    updateSessionExerciseRecord(
      exerciseId: state[SessionInitData.currentExerciseId],
      udpateDuration: stopWatch.duration,
    );
    final currentExerciseIndex =
        state[SessionInitData.currentExerciseIndex] as int;

    final allExercises = ref.read(exerciseDataSrcProvider).getInbuiltExerises;
    final length = allExercises.length;

    final prevIndex = (currentExerciseIndex - 1 + length) % length;
    updateSessionExerciseData(nextIndex: prevIndex);

    if (!mounted) {
      d.log('the context  not scope');

      return;
    }
    if (mounted) {
      d.log('the context is in scope state is updated');
      state = {...state};
    }
    // state = {...state};
  }

  void updateSessionExerciseData({required int nextIndex}) {
    if (!mounted) return;

    final allExercises = ref.read(exerciseDataSrcProvider).getInbuiltExerises;
    final nextExercise = allExercises.elementAt(nextIndex);
    state[SessionInitData.currentExerciseId] = nextExercise.id;
    state[SessionInitData.currentExerciseIndex] = nextIndex;
    state[SessionInitData.exerciseName] = nextExercise.title;

    state[SessionInitData.timeElapsed] = Duration.zero;
    ref.read(stopWatchProvider(stopWatchId).notifier).reset();
    if (mounted) {
      d.log('the context is in scope');
      d.log(state[SessionInitData.allExercises].toString());
      state = {...state};
    }
  }

  void playSelected({required String exerciseID}) {
    state = {...state};
  }

  // update the duration:feature is added as if user played an exercise again ->
  //then the already elapsed time is added to new stopwatch data
  void updateExerciseDuration() {}
}

final sessionDataProvider = StateNotifierProvider.autoDispose<
  SessionDataNotifier,
  Map<String, dynamic>
>((ref) {
  ref.onDispose(() => d.log('sessionDataProvider disposed'));
  final initData = ref.read(sessionInitDataSrcProvider);

  return SessionDataNotifier(initData.sessionInitData, ref);
});

// tomorrow
// 1.code yoga-sessions feature
// 2.code the simulation part
// 3.music part
// 4.OTA update ?
// 5(extra) previous sessions history
