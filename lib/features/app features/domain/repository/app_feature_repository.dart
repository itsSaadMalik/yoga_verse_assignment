import 'package:yoga_verse/features/app%20features/data/model/app_feature_model.dart';

abstract class AppFeatureRepository {
  Future<List<AppFeatureModel>?> getAppFeatures();
  // Future<bool> addToCart({required ProductModel product});
}
