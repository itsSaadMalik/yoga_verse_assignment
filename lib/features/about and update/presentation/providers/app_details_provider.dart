import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/features/about%20and%20update/presentation/providers/about_app_usecase_provider.dart';

final appDetailsProvider = FutureProvider.autoDispose<Map<String, String>>((
  ref,
) async {
  final appFeatures =
      await ref.watch(aboutAppUsecaseProvider).aboutAppDetails();
  return appFeatures;
});
