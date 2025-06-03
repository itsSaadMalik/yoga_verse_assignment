import 'package:yoga_verse/features/products/data/data%20src/products_data_src_impl.dart';
import 'package:yoga_verse/features/products/data/model/product_model.dart';
import 'package:yoga_verse/features/products/domain/repository/product_repository.dart';

class ProductsRepositoryImpl implements ProductRepository {
  // final FirebaseFirestore firebaseFirestore;
  final ProductsDataSourceImpl productsDataSourceImpl;

  ProductsRepositoryImpl({
    // required this.firebaseFirestore,
    required this.productsDataSourceImpl,
  });

  @override
  Future<List<ProductModel>?> getProducts() async {
    try {
      final productsData =
          await productsDataSourceImpl.fetchProductsFromDatabase();
      return productsData;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> addToCart({required ProductModel product}) async {
    throw UnimplementedError();
  }
}
