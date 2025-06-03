import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/core/shared/widgets/async_error_widget.dart';
import 'package:yoga_verse/core/shared/widgets/async_loading_widget.dart';
import 'package:yoga_verse/core/themes/app_colors.dart';
import 'package:yoga_verse/features/exercises/presentation/providers/exercise_provider.dart';
import 'package:yoga_verse/features/yoga_session/data/data%20source/session_init_data.dart';
import 'package:yoga_verse/features/yoga_session/presentation/provider/session_data_provider.dart';

class InstructionsWidget extends ConsumerWidget {
  const InstructionsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionData = ref.watch(sessionDataProvider);
    final currentExercise = ref.watch(
      exerciseProvider(sessionData[SessionInitData.currentExerciseId]),
    );
    return currentExercise.when(
      data:
          (data) =>
              data != null
                  ? Container(
                    height: 250,
                    padding: EdgeInsets.fromLTRB(15, 15, 10, 15),
                    decoration: BoxDecoration(
                      color: AppColors.applightThemePrimaryColor,
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            spacing: 5,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.title,
                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Position',
                                style: Theme.of(
                                  context,
                                ).textTheme.bodySmall?.copyWith(
                                  color: const Color.fromARGB(
                                    255,
                                    255,
                                    255,
                                    255,
                                  ),
                                  fontSize: 12,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: Text(
                                  data.position,
                                  style: Theme.of(context).textTheme.bodyMedium
                                      ?.copyWith(color: Colors.black),
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                data.comments ?? '',
                                style: Theme.of(
                                  context,
                                ).textTheme.bodySmall?.copyWith(
                                  color: const Color.fromARGB(
                                    255,
                                    255,
                                    255,
                                    255,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Image.asset(data.posePictureData, height: 90),
                        ),
                      ],
                    ),
                  )
                  : Container(
                    padding: EdgeInsets.fromLTRB(15, 15, 10, 15),
                    decoration: BoxDecoration(
                      color: AppColors.applightThemePrimaryColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    height: 90,
                    child: Center(
                      child: Text(
                        'No Exercise with this name found',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
      error: (error, stackTrace) => AsyncErrorWidget(),
      loading:
          () => Container(
            height: 250,
            width: MediaQuery.sizeOf(context).width,
            padding: EdgeInsets.fromLTRB(15, 15, 10, 15),
            decoration: BoxDecoration(
              color: AppColors.applightThemePrimaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: AsyncLoadingWidget(),
          ),
    );
  }
}
