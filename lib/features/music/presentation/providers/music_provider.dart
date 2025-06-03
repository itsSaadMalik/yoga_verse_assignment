import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:yoga_verse/injection/providers/music_src_provider.dart';
import 'dart:developer' as d;

class MusicPlayerNotifier extends StateNotifier<Duration> {
  final AudioPlayer audioPlayer;
  final List<AudioSource> audioSources;
  MusicPlayerNotifier(this.audioSources)
    : audioPlayer = AudioPlayer(),
      super(Duration.zero) {
    initAudioSources(audioSources);
    audioPlayer.positionStream.listen(
      (duration) => mounted ? state = duration : null,
    );
  }
  void initAudioSources(List<AudioSource> playlist) =>
      audioPlayer.setAudioSources(playlist);

  void play() => audioPlayer.play();
  void pause() => audioPlayer.pause();
  void stop() => audioPlayer.stop();

  void playNext() => audioPlayer.seekToNext();
  void playPrevious() => audioPlayer.seekToPrevious();

  Duration get currentDuration => state;
  Duration get trackDuration => audioPlayer.duration ?? Duration.zero;

  bool get isPlaying => audioPlayer.playing;
  void mute() => audioPlayer.setVolume(0);
  void unMute() => audioPlayer.setVolume(1.0);

  String get name => audioPlayer.sequenceState.currentSource?.tag ?? 'no title';
  int? get index => audioPlayer.currentIndex;
  bool get isMute => audioPlayer.volume == 0;

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }
}

final musicPlayerProvider =
    StateNotifierProvider.autoDispose<MusicPlayerNotifier, Duration>((ref) {
      ref.onDispose(() => d.log('musicPlayerProvider disposed'));
      final musics = ref.read(musicSourceProvider).musics;
      return MusicPlayerNotifier(musics);
    });
