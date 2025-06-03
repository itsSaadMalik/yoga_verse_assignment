import 'package:yoga_verse/features/about%20and%20update/data/data%20src/about_app_data_src_impl.dart';
import 'package:yoga_verse/features/about%20and%20update/data/model/mat_version_model.dart';
import 'package:yoga_verse/features/about%20and%20update/domain/repository/about_app_repository.dart';

class AboutAppRepositoryImpl implements AboutAppRepository {
  final AboutAppDataSourceImpl aboutAppDataSourceImpl;

  AboutAppRepositoryImpl({required this.aboutAppDataSourceImpl});

  @override
  Future<Map<String, String>> getAboutApp() async =>
      await aboutAppDataSourceImpl.fetchAppDetails();

  @override
  Future<MatVersionModel?> getMatUpdates() async =>
      await aboutAppDataSourceImpl.getMatUpdate();

  @override
  Future<bool> updateMat({required MatVersionModel updatedVersion}) async =>
      aboutAppDataSourceImpl.updateMatVersion(updatedVersion: updatedVersion);
}
