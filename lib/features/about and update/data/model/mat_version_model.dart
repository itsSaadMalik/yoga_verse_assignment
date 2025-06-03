import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yoga_verse/features/about%20and%20update/domain/entity/mat_version.dart';
import 'package:yoga_verse/features/app%20features/domain/entity/app_feature.dart';

class MatVersionModel extends Matversion {
  MatVersionModel({
    required super.updateId,
    required super.updateVersion,
    required super.description,
    required super.date,
  });

  factory MatVersionModel.fromMap(Map<String, dynamic> data) => MatVersionModel(
    updateId: data['update_id'] ?? '',
    updateVersion: data['version'] ?? '',
    description: data['description'] ?? '',
    date:
        (data['date']).runtimeType == String
            ? DateTime.parse(data['date'])
            : (data['date'] as Timestamp).toDate(),
  );
  Map<String, dynamic> toMap() => {
    'update_id': updateId,
    'version': updateVersion,
    'description': description,
    'date': date.toString(),
  };

  factory MatVersionModel.formJson(String source) =>
      MatVersionModel.fromMap(json.decode(source));

  String get toJson => json.encode(toMap());
}
