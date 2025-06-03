import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yoga_verse/features/app%20features/data/model/app_feature_model.dart';
import 'package:yoga_verse/features/app%20features/data/repo/app_feature_repo_impl.dart';
import 'dart:developer' as d;

class AppFeatureUsecase {
  final FirebaseFirestore firebaseFirestore;
  final AppFeatureRepositoryImpl appFeatureRepositoryImpl;

  AppFeatureUsecase({
    required this.firebaseFirestore,
    required this.appFeatureRepositoryImpl,
  });

  Future<List<AppFeatureModel>?> allFeatures() async {
    try {
      final products = await appFeatureRepositoryImpl.getAppFeatures();
      return products;
    } catch (e) {
      d.log(e.toString());
      return null;
    }
  }
}
