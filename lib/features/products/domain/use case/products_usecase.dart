import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yoga_verse/features/products/data/data%20src/products_data_src_impl.dart';
import 'package:yoga_verse/features/products/data/model/product_model.dart';
import 'package:yoga_verse/features/products/data/repo/products_repo_impl.dart';
import 'dart:developer' as d;

class ProductsUsecase {
  final FirebaseFirestore firebaseFirestore;
  final ProductsRepositoryImpl productsRepoImpl;

  ProductsUsecase({
    required this.firebaseFirestore,
    required this.productsRepoImpl,
  });

  Future<List<ProductModel>?> allProducts() async {
    try {
      final products = await productsRepoImpl.getProducts();
      return products;
    } catch (e) {
      d.log(e.toString());
      return null;
    }
  }
}
