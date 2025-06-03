import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/features/mat/data/model/data_observation_model.dart';
import 'package:yoga_verse/features/mat/presentation/position_model.dart';
import 'package:yoga_verse/features/mat/presentation/providers/comments_porvider.dart';
import 'package:yoga_verse/features/mat/presentation/providers/mat_color_provider.dart';

class AlignmentFeedbackWidget extends ConsumerWidget {
  const AlignmentFeedbackWidget({
    super.key,
    required this.observationData,
    required this.iconName,
    required this.textWidgetPosition,
    required this.limbsFeedbackPosition,
  });
  final MatDataObservationModel observationData;
  final String iconName;
  final PositionModel textWidgetPosition;
  final PositionModel limbsFeedbackPosition;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final message = ref.watch(appropriateCommentProvider(observationData));
    final color = ref.watch(appropriateColorProvider(observationData));
    return Container(
      child: Stack(
        // fit: StackFit.expand,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Positioned(
            left: limbsFeedbackPosition.left,
            right: limbsFeedbackPosition.right,
            top: limbsFeedbackPosition.top,
            bottom: limbsFeedbackPosition.bottom,
            child: Image.asset(
              'assets/images/$iconName.png',
              height: 32.5,
              color: color,
            ),
          ),
          Positioned(
            left: textWidgetPosition.left,
            right: textWidgetPosition.right,
            top: textWidgetPosition.top,
            bottom: textWidgetPosition.bottom,

            child: SizedBox(
              width: 100,
              child: Text(
                message,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.black,
                  fontSize: 11,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
