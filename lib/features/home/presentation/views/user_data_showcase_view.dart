import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/core/shared/widgets/async_error_widget.dart';
import 'package:yoga_verse/core/themes/app_theme.dart';
import 'package:yoga_verse/features/home/presentation/providers/home_screen_data_provider.dart';
import 'package:yoga_verse/features/home/presentation/providers/home_screen_usecase_provider.dart';
import 'package:yoga_verse/features/home/presentation/widgets/streak_widget.dart';

class UserDataShowcaseWidget extends ConsumerWidget {
  const UserDataShowcaseWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userHomeScreenData = ref.watch(homeScreenDataProvider);

    return SizedBox(
      height: 320,
      child: userHomeScreenData.when(
        data: (data) => ShowCaseWidgets(userHomeData: data),
        error: (error, stackTrace) => AsyncErrorWidget(error: error.toString()),
        loading: () => ShowCaseWidgets(isEnabled: true),
      ),
    );
  }
}
