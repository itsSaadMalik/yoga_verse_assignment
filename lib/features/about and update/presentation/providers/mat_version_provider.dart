import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yoga_verse/features/about%20and%20update/data/model/mat_version_model.dart';
import 'dart:developer' as d;

import 'package:yoga_verse/features/about%20and%20update/domain/use%20case/app_feature_usecase.dart';
import 'package:yoga_verse/features/about%20and%20update/presentation/providers/about_app_usecase_provider.dart';

final matVersionProvider = FutureProvider.autoDispose<MatVersionModel?>((
  ref,
) async {
  final pref = await SharedPreferences.getInstance();
  final json = pref.getString('mat_version');
  d.log('mat current version  $json');
  if (json == null) {
    return null;
  }
  final currentVersion = MatVersionModel.formJson(json);
  return currentVersion;
});

class MatVersionNotifier extends StateNotifier<MatVersionModel?> {
  Ref ref;
  MatVersionNotifier(this.ref) : super(null) {
    init();
  }
  init() async {
    final pref = await SharedPreferences.getInstance();

    final json = pref.getString('mat_version');
    // d.log('mat current version  $json');
    if (json != null) {
      state = MatVersionModel.formJson(json);
    }
  }

  udpate({required MatVersionModel updatedVersion}) async {
    ref.read(aboutAppUsecaseProvider).updateMat(updatedVersion: updatedVersion);
    state = updatedVersion;
  }
}

final matVersionHandlerProvider =
    StateNotifierProvider.autoDispose<MatVersionNotifier, MatVersionModel?>((
      ref,
    ) {
      return MatVersionNotifier(ref);
    });
