import 'package:yoga_verse/features/products/domain/entity/product.dart';

class ProductModel extends Product {
  ProductModel({
    required super.id,
    required super.name,
    required super.productLink,
    required super.pictureLink,
    required super.price,
  });

  factory ProductModel.fromMap(Map<String, dynamic> data) => ProductModel(
    id: data['id'] ?? '',
    name: data['name'] ?? '',
    productLink: data['product_link'] ?? '',
    pictureLink: data['picture_link'] ?? '',
    price: (data['price']).toDouble() ?? 0.00,
  );
  // no need for toMap as i dont i have admin panel as of now
}
