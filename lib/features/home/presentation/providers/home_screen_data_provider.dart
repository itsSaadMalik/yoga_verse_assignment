import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/features/home/data/model/user_home_data_model.dart';
import 'package:yoga_verse/features/home/presentation/providers/home_screen_usecase_provider.dart';

final homeScreenDataProvider = FutureProvider<UserHomeDataModel?>((ref) async {
  final data = await ref.watch(homeScreenUseCaseProvider).getHomeScreenData();
  return data;
});
