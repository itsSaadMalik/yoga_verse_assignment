import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yoga_verse/features/products/data/model/product_model.dart';
import 'package:yoga_verse/features/products/domain/data%20src/products_data_src.dart';

class ProductsDataSourceImpl implements ProductsDataSource {
  final FirebaseFirestore firebaseFirestore;

  ProductsDataSourceImpl({required this.firebaseFirestore});
  @override
  Future<List<ProductModel>?> fetchProductsFromDatabase() async {
    try {
      final querySnapshot =
          await firebaseFirestore.collection('products').get();
      final docs = querySnapshot.docs.toList();
      final productsList =
          docs.map((e) => ProductModel.fromMap(e.data())).toList();
      return productsList;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<bool> addToCart({required ProductModel product}) async {
    throw UnimplementedError();
  }
}
