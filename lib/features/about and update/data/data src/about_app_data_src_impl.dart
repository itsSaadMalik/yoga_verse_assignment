import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yoga_verse/features/about%20and%20update/data/model/mat_version_model.dart';
import 'package:yoga_verse/features/about%20and%20update/domain/data%20src/about_app_data_src.dart';
import 'package:yoga_verse/features/about%20and%20update/domain/entity/mat_version.dart';
import 'package:yoga_verse/features/about%20and%20update/presentation/providers/mat_version_provider.dart';
import 'dart:developer' as d;

class AboutAppDataSourceImpl implements AboutAppDataSource {
  final FirebaseFirestore firebaseFirestore;
  Ref ref;

  AboutAppDataSourceImpl({required this.firebaseFirestore, required this.ref});

  @override
  Future<Map<String, String>> fetchAppDetails() async {
    try {
      return appDetails;
    } catch (e) {
      debugPrint(e.toString());
      return {};
    }
  }

  @override
  Future<MatVersionModel?> getMatUpdate() async {
    // if returned null then that means the mat is up-to-date
    try {
      final querySnapshot =
          await firebaseFirestore.collection('updates').orderBy('date').get();
      final docs = querySnapshot.docs;
      final latestVersion = MatVersionModel.fromMap(docs.elementAt(0).data());
      final existingMatVersion = await ref.read(matVersionProvider.future);
      // debugPrint(latestVersion.updateVersion);
      if (existingMatVersion == null) return latestVersion;
      return latestVersion.date.isAfter(existingMatVersion.date)
          ? latestVersion
          : null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> updateMatVersion({
    required MatVersionModel updatedVersion,
  }) async {
    d.log('mat current version  ${updatedVersion.toJson}');

    try {
      d.log('mat current version  ${updatedVersion.toJson}');

      final pref = await SharedPreferences.getInstance();
      d.log('mat current version  ${updatedVersion.toJson}');
      final result = await pref.setString('mat_version', updatedVersion.toJson);
      return result;
    } catch (e) {
      return false;
    }
  }

  // a local method:no needed anymore!
  // Future<MatVersionModel?> currentMatVersion() async {
  //   try {
  //     final currentVersion = await ref.read(matVersionProvider.future);
  //     if (currentVersion == null) return null;
  //     return currentVersion;
  //   } catch (e) {
  //     return null;
  //   }
  // }

  Map<String, String> appDetails = {
    'Connect Seamlessly':
        'Pair your smart mat with your phone via Bluetooth or Wi-Fi for real-time syncing.',

    'Start Your Session': 'Begin a guided yoga session directly from the app.',

    'Track Your Alignment':
        'View posture, pressure points, and real-time position feedback for each pose.',

    'Follow Instructions':
        'Get clear pose-by-pose instructions and audio guidance.',

    'Monitor Time': 'See time elapsed for each pose and your entire session.',

    'Switch Exercises':
        'Easily move to the next or previous exercise during your routine.',

    'Use Independent Stopwatch':
        'Start a built-in stopwatch for any custom practice outside sessions.',

    'Play Your Music':
        'Control background music with play, pause, mute, next, and previous options — all within the app.',
  };
}
