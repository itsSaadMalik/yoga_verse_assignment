import 'package:yoga_verse/features/app%20features/data/model/app_feature_model.dart';
import 'package:yoga_verse/features/products/data/model/product_model.dart';

abstract class AppFeatureDataSource {
  Future<List<AppFeatureModel>?> fetchAppFeatureFromDatabase();
}
