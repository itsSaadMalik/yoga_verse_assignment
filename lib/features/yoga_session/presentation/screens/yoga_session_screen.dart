import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/core/shared/widgets/error_message_snackbar.dart';
import 'package:yoga_verse/core/utils/enums/connection_type.dart';
import 'package:yoga_verse/core/utils/helpers/edget_inset.dart';
import 'package:yoga_verse/core/widgets/gradient_app_background.dart';
import 'package:yoga_verse/features/connection%20to%20mat/presentation/providers/current_connection_provider.dart';
import 'package:yoga_verse/features/exercises/presentation/providers/exercise_provider.dart';
import 'package:yoga_verse/features/exercises/presentation/providers/exercise_repo_provider.dart';
import 'package:yoga_verse/features/mat/presentation/widgets/mat_widget.dart';
import 'package:yoga_verse/features/stop%20watch/providers/stop_watch_provider.dart';
import 'package:yoga_verse/features/yoga_session/data/data%20source/session_init_data.dart';
import 'package:yoga_verse/features/yoga_session/presentation/provider/session_data_provider.dart';
import 'package:yoga_verse/features/yoga_session/presentation/provider/upload_session_usecase_provider.dart';
import 'package:yoga_verse/features/yoga_session/presentation/screens/no_connection_screen.dart';
import 'package:yoga_verse/features/yoga_session/presentation/screens/views/app_bar.dart';
import 'package:yoga_verse/features/stop%20watch/widgets/stopwatch_widget.dart';
import 'package:yoga_verse/features/yoga_session/presentation/screens/views/instructions_widget.dart';
import 'package:yoga_verse/features/yoga_session/presentation/screens/views/music_widget.dart';
import 'package:yoga_verse/features/yoga_session/presentation/screens/views/overlay_instructions_widget.dart';
import 'package:yoga_verse/features/yoga_session/presentation/screens/views/session_data_widget.dart';
import 'package:yoga_verse/features/yoga_session/presentation/screens/widgets/save_session_pop_up.dart';

class YogaSessionScreen extends ConsumerStatefulWidget {
  const YogaSessionScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _YogaSessionScreenState();
}

class _YogaSessionScreenState extends ConsumerState<YogaSessionScreen> {
  @override
  Widget build(BuildContext context) {
    final isConnected =
        ref.watch(currentConnectionProvider) != MatConnectionType.none;

    return PopScope(
      canPop: !isConnected,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          final result = await showDialog<bool?>(
            context: context,
            builder: (context) => SaveSessionPopUp(),
          );
          // no sessio-data saving
          if (context.mounted) {
            switch (result) {
              case null:
                Navigator.of(context).pop();
              case true:
                // perform some actions based on this
                // 1.inc no of sessions
                // 2.inc the most performed  exercises
                // 3.save data to database
                // {
                final uploadSessionUsecase = ref.watch(uploadSessionProvider);
                final sessionData = ref.read(sessionDataProvider);
                // update exercise score
                final scoreResult = await uploadSessionUsecase
                    .updateExerciseScore(
                      sessionExercise:
                          sessionData[SessionInitData.allExercises],
                    );
                // upload session data to database
                final sessionUploadResults = await uploadSessionUsecase
                    .uploadSessionData(
                      sessionExercise:
                          sessionData[SessionInitData.allExercises],
                      totalDuration:
                          ref.read(stopWatchProvider('session_watch')).duration,
                    );
                final res = await uploadSessionUsecase.updateStreak(
                  date: DateTime.now(),
                );
                // if (context.mounted && result) Navigator.of(context).pop();
                // }
                if (context.mounted) {
                  errorHandingSnackBar(
                    context: context,
                    errorMessage: 'Data Saved !',
                  );
                  Navigator.of(context).pop();
                }
              case false:
                // just pop of
                Navigator.of(context).pop();
            }
          }
        }
      },
      child: GradientAppBackground(
        child: SafeArea(
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: SessionScreenAppBar(),
            ),
            body: SingleChildScrollView(
              padding: screenStandartEdgeInset,
              child:
                  isConnected
                      ? Column(
                        children: [
                          overlayInstructionsWidget(),
                          MatWidget(),
                          InstructionsWidget(),
                          SizedBox(height: 50),
                          SessionDataWidget(),
                          MusicWidget(),
                        ],
                      )
                      : NoConnectionScreen(),
            ),
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
