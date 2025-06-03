import 'package:yoga_verse/features/app%20features/domain/entity/app_feature.dart';

class AppFeatureModel extends AppFeature {
  AppFeatureModel({
    required super.id,
    required super.featureName,
    required super.description,
    required super.productLink,
    required super.pictureLink,
  });

  factory AppFeatureModel.fromMap(Map<String, dynamic> data) => AppFeatureModel(
    id: data['id'] ?? '',
    featureName: data['feature_name'] ?? '',
    description: data['description'] ?? '',

    productLink: data['link'] ?? '',
    pictureLink: data['picture_link'] ?? '',
  );
  // no need for toMap as i dont i have admin panel as of now
}
