import 'package:yoga_verse/features/about%20and%20update/data/model/mat_version_model.dart';
import 'package:yoga_verse/features/about%20and%20update/domain/entity/mat_version.dart';

abstract class AboutAppDataSource {
  Future<Map<String, String>> fetchAppDetails();
  Future<Matversion?> getMatUpdate();
  Future<bool> updateMatVersion({required MatVersionModel updatedVersion});
}
