import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/features/app%20features/data/repo/app_feature_repo_impl.dart';
import 'package:yoga_verse/features/app%20features/presentation/providers/app_feature_data_src_provider.dart';

final appFeatureRepositoryProvider = Provider<AppFeatureRepositoryImpl>((ref) {
  final appFeatureDataSource = ref.read(appFeatureDataSourceProvider);

  return AppFeatureRepositoryImpl(
    appFeatureDataSourceImpl: appFeatureDataSource,
  );
});
