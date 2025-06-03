import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/features/mat/data/model/data_observation_model.dart';

final appropriateColorProvider =
    Provider.family<Color, MatDataObservationModel>((
      ref,
      MatDataObservationModel observedData,
    ) {
      final expected = observedData.expectedExerciseData;
      final observed = observedData.observedMatData;
      return observed == expected
          ? const Color.fromARGB(255, 18, 230, 25)
          : observed > expected
          ? const Color.fromARGB(255, 228, 60, 48)
          : const Color.fromARGB(255, 240, 154, 25);
    });
