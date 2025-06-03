import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/features/about%20and%20update/data/model/mat_version_model.dart';
import 'package:yoga_verse/features/about%20and%20update/presentation/providers/about_app_usecase_provider.dart';

final matUpdatesProvider = FutureProvider.autoDispose<MatVersionModel?>((
  ref,
) async {
  final aboutAppUsecase = await ref.watch(aboutAppUsecaseProvider).matUpdate();
  return aboutAppUsecase;
});
