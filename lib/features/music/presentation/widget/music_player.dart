import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:yoga_verse/features/music/presentation/providers/music_provider.dart';

class MusicPlayerWidget extends ConsumerWidget {
  const MusicPlayerWidget({
    super.key,
    this.isEnabled = false,
    // this.audioPlayer,
  });
  final bool isEnabled;
  // final AudioPlayer? musicPlayer;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final musicPlayer = ref.watch(musicPlayerProvider);
    final isPlaying = ref.watch(musicPlayerProvider.notifier).isPlaying;
    final trackTitle = ref.watch(musicPlayerProvider.notifier).name;
    return Skeletonizer(
      enabled: isEnabled,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 5, 15, 10),
              child: Text(
                trackTitle,
                softWrap: true,
                overflow: TextOverflow.fade,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            SizedBox(
              // width: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () async {
                      ref.read(musicPlayerProvider.notifier).playPrevious();
                    },
                    icon: Icon(Icons.skip_previous_rounded),
                    color: Colors.black,
                  ),
                  InkWell(
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.white,
                      child: Icon(
                        isPlaying
                            ? Icons.pause_rounded
                            : Icons.play_arrow_rounded,
                        color: Colors.black,
                        size: 26,
                      ),
                    ),
                    onTap: () async {
                      isPlaying
                          ? ref.read(musicPlayerProvider.notifier).pause()
                          : ref.read(musicPlayerProvider.notifier).play();
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.skip_next_rounded),
                    color: Colors.black,
                    onPressed: () async {
                      ref.read(musicPlayerProvider.notifier).playNext();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
