import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/features/mat/data/model/data_observation_model.dart';

final appropriateCommentProvider =
    Provider.family<String, MatDataObservationModel>((
      ref,
      MatDataObservationModel obeservedData,
    ) {
      final expected = obeservedData.expectedExerciseData;
      final observed = obeservedData.observedMatData;
      return observed < expected
          ? 'apply more pressue on ${obeservedData.matArea}'
          : observed > expected
          ? 'reduce the load on ${obeservedData.matArea}'
          : 'Good';
    });
