import 'package:yoga_verse/features/products/data/model/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>?> getProducts();
  Future<bool> addToCart({required ProductModel product});
}
