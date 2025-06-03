import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/features/app%20features/data/model/app_feature_model.dart';
import 'package:yoga_verse/features/app%20features/presentation/providers/app_feature_usecase_provider.dart';

final appFeaturesProvider = FutureProvider.autoDispose<List<AppFeatureModel>?>((
  ref,
) async {
  final appFeatures = ref.watch(appFeatureUsecaseProvider).allFeatures();
  return appFeatures;
});
