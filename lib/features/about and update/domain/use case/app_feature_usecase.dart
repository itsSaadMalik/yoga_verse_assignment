import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yoga_verse/features/about%20and%20update/data/model/mat_version_model.dart';
import 'package:yoga_verse/features/about%20and%20update/data/repo/about_app_repo_impl.dart';
import 'dart:developer' as d;

class AboutAppUsecase {
  final FirebaseFirestore firebaseFirestore;
  final AboutAppRepositoryImpl aboutAppRepositoryImpl;

  AboutAppUsecase({
    required this.firebaseFirestore,
    required this.aboutAppRepositoryImpl,
  });

  Future<Map<String, String>> aboutAppDetails() async {
    try {
      final appDetails = await aboutAppRepositoryImpl.getAboutApp();
      return appDetails;
    } catch (e) {
      d.log(e.toString());
      return {};
    }
  }

  Future<MatVersionModel?> matUpdate() async {
    try {
      final latestversion = await aboutAppRepositoryImpl.getMatUpdates();
      return latestversion;
    } catch (e) {
      d.log(e.toString());
      return null;
    }
  }

  Future<bool> updateMat({required MatVersionModel updatedVersion}) async {
    try {
      final latestversion = await aboutAppRepositoryImpl.updateMat(
        updatedVersion: updatedVersion,
      );
      return latestversion;
    } catch (e) {
      d.log(e.toString());
      return false;
    }
  }
}
