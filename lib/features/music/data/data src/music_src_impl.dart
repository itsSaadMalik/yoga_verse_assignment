import 'package:just_audio/just_audio.dart';
import 'package:yoga_verse/features/music/domain/data%20src/music_src.dart';

class MusicDataSourceImpl implements MusicDataSource {
  List<AudioSource> allAudioSources = [
    AudioSource.asset('assets/music/Hall of Fame.mp3', tag: 'Hall of Fame'),
    AudioSource.asset('assets/music/Pill.mp3', tag: 'Pills'),
    AudioSource.asset(
      'assets/music/Relaxing sound.opus',
      tag: 'Relaxing track',
    ),
  ];
  List<String> musicTrackTitlesList = [
    'Hall of Fame',
    'Pills',
    'Relaxing track',
  ];

  @override
  List<AudioSource> get musics => allAudioSources;

  @override
  List<String> get musicsTrackTitles => musicTrackTitlesList;
}
