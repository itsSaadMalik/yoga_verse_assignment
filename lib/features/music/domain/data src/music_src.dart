import 'package:just_audio/just_audio.dart';

abstract class MusicDataSource {
  List<AudioSource> get musics;
  List<String> get musicsTrackTitles;
}
