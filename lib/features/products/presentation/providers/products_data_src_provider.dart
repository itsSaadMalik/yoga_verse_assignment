import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/features/products/data/data%20src/products_data_src_impl.dart';
import 'package:yoga_verse/injection/providers/firestore_provider.dart';

final productsDataSourceProvider = Provider<ProductsDataSourceImpl>((ref) {
  final firestore = ref.read(firestoreProvider);

  return ProductsDataSourceImpl(firebaseFirestore: firestore);
});
