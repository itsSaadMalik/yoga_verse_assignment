import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/core/themes/app_colors.dart';
import 'package:yoga_verse/features/music/presentation/providers/music_provider.dart';
import 'package:yoga_verse/injection/providers/music_src_provider.dart';

class MusicInfoWidget extends ConsumerWidget {
  const MusicInfoWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final musicPlayer = ref.watch(musicPlayerProvider);
    final currentTrackDuraion =
        ref.watch(musicPlayerProvider.notifier).trackDuration;
    final progress =
        musicPlayer.inMilliseconds / currentTrackDuraion.inMilliseconds;
    final allTracks = ref.watch(musicSourceProvider).musicsTrackTitles;
    final currentIndex = ref.watch(musicPlayerProvider.notifier).index;
    final isMute = ref.watch(musicPlayerProvider.notifier).isMute;
    // debugPrint(progress.toString());
    return Container(
      height: 160,
      width: MediaQuery.sizeOf(context).width - (180 / 2),
      padding: EdgeInsets.fromLTRB((170 / 2), 10, 10, 10),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(100)),
        color: AppColors.applightThemePrimaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 15, 10, 10),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: LinearProgressIndicator(
                borderRadius: BorderRadius.circular(2),
                value: progress.isFinite ? progress : .0,
                color: Colors.white,

                backgroundColor: Colors.black,
              ),
            ),
            ListView.builder(
              padding: EdgeInsets.fromLTRB(15, 20, 20, 10),
              itemBuilder: (context, index) {
                final currentTrack = allTracks.elementAt(index);

                return Padding(
                  padding: const EdgeInsets.only(top: 3.0),
                  child: Text(
                    currentTrack,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color:
                          index == currentIndex ? Colors.black : Colors.white,
                    ),
                  ),
                );
              },
              shrinkWrap: true,
              itemCount: allTracks.length,
            ),
            Positioned(
              bottom: 10,
              right: 5,
              child: InkWell(
                onTap: () {
                  isMute
                      ? ref.read(musicPlayerProvider.notifier).unMute()
                      : ref.read(musicPlayerProvider.notifier).mute();
                },
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                    // gradient: AppColors.secondaryLinearBackground,
                  ),
                  // radius: 16,
                  child: Icon(
                    isMute
                        ? CupertinoIcons.volume_off
                        : CupertinoIcons.volume_down,
                    color: Colors.white,
                    size: 20,
                    // color: isMute ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
