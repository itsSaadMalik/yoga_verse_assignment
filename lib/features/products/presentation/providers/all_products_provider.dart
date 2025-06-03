import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/features/products/data/model/product_model.dart';
import 'package:yoga_verse/features/products/presentation/providers/product_usecase_provider.dart';

final allProductsProvider = FutureProvider.autoDispose<List<ProductModel>?>((
  ref,
) async {
  final products = ref.watch(productUsecaseProvider).allProducts();
  return products;
});
