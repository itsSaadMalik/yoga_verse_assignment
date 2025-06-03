import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/core/themes/app_colors.dart';
import 'package:yoga_verse/features/music/presentation/widget/music_player.dart';

class CircularMusicWidget extends ConsumerWidget {
  const CircularMusicWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.only(bottom: 10, top: 10, left: 10, right: 10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: AppColors.secondaryLinearBackground,
      ),
      clipBehavior: Clip.hardEdge,
      child: MusicPlayerWidget(),
    );
  }
}
