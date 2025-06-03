import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/core/themes/app_theme.dart';
import 'package:yoga_verse/features/stop%20watch/providers/stop_watch_provider.dart';

class SessionStopWatch extends ConsumerWidget {
  const SessionStopWatch({super.key});
  final String stopWatchID = 'over_all_time';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionDuration = ref.watch(stopWatchProvider(stopWatchID));
    return Container(
      height: 135,
      width: 160,
      padding: EdgeInsets.fromLTRB(10, 10, 5, 5),
      decoration: BoxDecoration(
        color: AppTheme.lightTheme.primaryColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Overall Time',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontSize: 14),
          ),
          Center(
            child: Text(
              (sessionDuration.duration).toString().substring(2, 10),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.black,
                fontSize: 17,
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed:
                    () =>
                        ref
                            .read(stopWatchProvider(stopWatchID).notifier)
                            .reset(),
                icon: Icon(
                  Icons.refresh_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  onPressed:
                      () =>
                          sessionDuration.isRunning
                              ? ref
                                  .read(stopWatchProvider(stopWatchID).notifier)
                                  .stop()
                              : ref
                                  .read(stopWatchProvider(stopWatchID).notifier)
                                  .start(),
                  icon: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    child: Icon(
                      sessionDuration.isRunning
                          ? Icons.pause_rounded
                          : Icons.play_arrow_rounded,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
