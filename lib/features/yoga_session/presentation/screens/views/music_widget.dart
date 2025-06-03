import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/core/themes/app_colors.dart';
import 'package:yoga_verse/features/music/presentation/views/circular_music_widget.dart';
import 'package:yoga_verse/features/music/presentation/widget/music_info_widget.dart';

class MusicWidget extends ConsumerWidget {
  const MusicWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 200,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(top: 4, right: 5, child: MusicInfoWidget()),
          Positioned(
            top: 0,
            left: 5,
            child: Container(
              height: 170,
              width: 170,
              padding: EdgeInsets.all(5),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.applightThemePrimaryColor,
              ),
              child: CircularMusicWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
