import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/features/mat/data/model/yoga_mat_data_model.dart';
import 'package:yoga_verse/features/mat/presentation/providers/mock_simulation_datasrc_provider.dart';
import 'dart:developer' as d;

class SimulationDataNotifier extends StateNotifier<YogaMatDataModel> {
  Ref ref;
  int index = 0;
  late List<YogaMatDataModel> mockData;
  late int length;
  late Timer localTimer; //= Timer.periodic(Duration(seconds: 2), (timer) {});

  SimulationDataNotifier(
    super._state, {
    required this.ref,
    required this.mockData,
    required this.length,
  }) {
    // activate();
    d.log('called once');
    // Timer.periodic(Duration(seconds: 2), (timer) {
    //   if (timer.isActive) {
    //     d.log(state.exerciseName ?? state.leftHandPressure.toString());
    //   }
    //   state = mockData.elementAt(index % length);
    //   state = state;
    //   index++;
    // }
    // );
  }

  // @override
  // void dispose() {
  //   localTimer.cancel();
  //   super.dispose();
  // }

  void activate() {
    if (kDebugMode) d.log('timer created');

    localTimer = Timer.periodic(Duration(seconds: 2), (timer) {
      if (timer.isActive) {
        // d.log(state.e
        //xerciseName ?? state.leftHandPressure.toString());
      }
      if (!mounted) return;

      state = mockData.elementAt(index % length);
      index++;
    });
  }

  void deactivate() {
    d.log('timer canceled');
    localTimer.cancel();
  }
}

final simulationDataProvider =
    StateNotifierProvider.autoDispose<SimulationDataNotifier, YogaMatDataModel>(
      (ref) {
        ref.onDispose(() => d.log('simulationDataProvider disposed'));
        final mockMatDataSrc = ref.read(mockSimulationDataProvider);
        final mockData = mockMatDataSrc.getSimulationDataFor;
        final length = mockData.length;
        return SimulationDataNotifier(
          mockData.elementAt(0),
          ref: ref,
          mockData: mockData,
          length: length,
        );
      },
    );
