import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yoga_verse/features/app%20features/data/model/app_feature_model.dart';
import 'package:yoga_verse/features/app%20features/domain/data%20src/app_feature_data_src.dart';

class AppFeatureDataSourceImpl implements AppFeatureDataSource {
  final FirebaseFirestore firebaseFirestore;

  AppFeatureDataSourceImpl({required this.firebaseFirestore});

  @override
  Future<List<AppFeatureModel>?> fetchAppFeatureFromDatabase() async {
    try {
      final querySnapshot =
          await firebaseFirestore.collection('features').get();
      final docs = querySnapshot.docs.toList();
      final featuresList =
          docs.map((e) => AppFeatureModel.fromMap(e.data())).toList();
      return featuresList;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
