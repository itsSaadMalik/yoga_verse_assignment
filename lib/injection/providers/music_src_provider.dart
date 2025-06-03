import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/features/music/data/data%20src/music_src_impl.dart';
import 'package:yoga_verse/features/music/domain/data%20src/music_src.dart';

final musicSourceProvider = Provider<MusicDataSource>((ref) {
  return MusicDataSourceImpl();
});
