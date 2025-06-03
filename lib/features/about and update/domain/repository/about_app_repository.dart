import 'package:yoga_verse/features/about%20and%20update/data/model/mat_version_model.dart';
import 'package:yoga_verse/features/about%20and%20update/domain/entity/mat_version.dart';
import 'package:yoga_verse/features/app%20features/data/model/app_feature_model.dart';

abstract class AboutAppRepository {
  Future<Map<String, String>> getAboutApp();
  Future<Matversion?> getMatUpdates();
  Future<bool> updateMat({required MatVersionModel updatedVersion});
}
