import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/features/products/data/repo/products_repo_impl.dart';
import 'package:yoga_verse/features/products/presentation/providers/products_data_src_provider.dart';

final productsRepositoryProvider = Provider<ProductsRepositoryImpl>((ref) {
  final productDataSource = ref.read(productsDataSourceProvider);

  return ProductsRepositoryImpl(productsDataSourceImpl: productDataSource);
});
