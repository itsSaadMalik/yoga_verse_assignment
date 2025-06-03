import 'package:yoga_verse/features/products/data/model/product_model.dart';

abstract class ProductsDataSource {
  Future<List<ProductModel>?> fetchProductsFromDatabase();
  Future<bool> addToCart({required ProductModel product});
}
