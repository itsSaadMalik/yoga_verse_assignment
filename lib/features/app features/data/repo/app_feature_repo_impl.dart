import 'package:yoga_verse/features/app%20features/data/data%20src/app_feature_data_src_impl.dart';
import 'package:yoga_verse/features/app%20features/data/model/app_feature_model.dart';
import 'package:yoga_verse/features/app%20features/domain/repository/app_feature_repository.dart';

class AppFeatureRepositoryImpl implements AppFeatureRepository {
  final AppFeatureDataSourceImpl appFeatureDataSourceImpl;

  AppFeatureRepositoryImpl({required this.appFeatureDataSourceImpl});

  @override
  Future<List<AppFeatureModel>?> getAppFeatures() async {
    return await appFeatureDataSourceImpl.fetchAppFeatureFromDatabase();
  }
}
