import 'dart:async' show Timer;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:developer' as d;

import 'package:yoga_verse/features/stop%20watch/model/stop_watch.dart';

class StopWatchNotifier extends StateNotifier<StopWatchModel> {
  final Stopwatch _stopwatch = Stopwatch(); // core timer logic
  late final Timer _timer;

  StopWatchNotifier(super._state) {
    _stopwatch.start();
    // Updates state every second when stopwatch is running
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      // d.log(_timer.isActive.toString());
      if (_stopwatch.isRunning) {
        state = state.copywith(
          duration: _stopwatch.elapsed,
        ); // triggers UI update
      }
    });
  }

  void start() {
    _stopwatch.start();
    state = state.copywith(isRunning: true);
  } // starts stopwatch

  void stop() {
    // pauses stopwatch
    _stopwatch.stop();
    state = state.copywith(isRunning: false);
  }

  void reset() {
    _stopwatch.reset(); // resets internal stopwatch
    state = state.copywith(
      duration: (Duration.zero),
      // isRunning: false,
    ); // resets UI to 00:00
  }

  void upadte({required Duration duration}) {
    // _stopwatch.reset(); // resets internal stopwatch
    state = state.copywith(
      duration: (state.duration) + duration,
      // isRunning: false,
    ); // resets UI to 00:00
  }

  @override
  void dispose() {
    _timer.cancel(); // cleanup when provider dies
    super.dispose();
  }
}

final stopWatchProvider = StateNotifierProvider.autoDispose
    .family<StopWatchNotifier, StopWatchModel, String>((ref, String id) {
      ref.onDispose(() => d.log('stopWatch provider disposed'));
      final initialTime = StopWatchModel(
        duration: Duration.zero,
        isRunning: true,
      );
      return StopWatchNotifier(initialTime);
    });
