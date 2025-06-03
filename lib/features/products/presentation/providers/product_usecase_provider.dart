import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/features/products/domain/use%20case/products_usecase.dart';
import 'package:yoga_verse/features/products/presentation/providers/product_repo_impl_provider.dart';
import 'package:yoga_verse/injection/providers/firestore_provider.dart';

final productUsecaseProvider = Provider<ProductsUsecase>((ref) {
  final firestore = ref.read(firestoreProvider);
  final productsRepo = ref.read(productsRepositoryProvider);
  return ProductsUsecase(
    firebaseFirestore: firestore,
    productsRepoImpl: productsRepo,
  );
});
