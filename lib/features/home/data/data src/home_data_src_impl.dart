import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yoga_verse/features/home/data/model/user_home_data_model.dart';
import 'package:yoga_verse/features/home/domain/data%20src/home_data_src.dart';
import 'package:yoga_verse/features/home/domain/entity/user_home_data.dart';
import 'dart:developer' as d;

class HomeDataSourceImpl implements HomeDataSource {
  final FirebaseFirestore firebaseFirestore;

  HomeDataSourceImpl({required this.firebaseFirestore});
  @override
  Future<int> getCurrentStreak({required String uid}) {
    throw UnimplementedError();
  }

  @override
  Future<UserHomeDataModel?> getUserHomeData({required String uid}) async {
    try {
      final doc =
          await firebaseFirestore.collection('user_data').doc(uid).get();
      final homeScreenData = UserHomeDataModel.fromMap(doc.data() ?? {});
      return homeScreenData;
    } catch (e) {
      d.log(e.toString());
      return null;
    }
  }

  @override
  Future<int> updateCurrentStreak({required String uid}) {
    throw UnimplementedError();
  }
}
