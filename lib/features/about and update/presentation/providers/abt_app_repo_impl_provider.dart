import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/features/about%20and%20update/data/repo/about_app_repo_impl.dart';
import 'package:yoga_verse/features/about%20and%20update/presentation/providers/about_app_data_src_provider.dart';

final aboutAppRepositoryProvider = Provider<AboutAppRepositoryImpl>((ref) {
  final aboutAppDataSourceImpl = ref.read(aboutAppDataSourceProvider);

  return AboutAppRepositoryImpl(aboutAppDataSourceImpl: aboutAppDataSourceImpl);
});
