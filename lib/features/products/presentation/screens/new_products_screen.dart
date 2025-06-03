import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/core/route_names.dart';
import 'package:yoga_verse/core/shared/widgets/async_error_widget.dart';
import 'package:yoga_verse/core/widgets/gradient_app_background.dart';
import 'package:yoga_verse/features/products/presentation/providers/all_products_provider.dart';
import 'package:yoga_verse/features/products/presentation/widgets/products_gridview.dart';

class NewProductsScreen extends ConsumerWidget {
  const NewProductsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(allProductsProvider);
    return GradientAppBackground(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Products'),
          titleTextStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 17,
          ),
          actions: [
            IconButton(
              onPressed: () => Navigator.pushNamed(context, RouteNames.myCart),
              icon: Icon(Icons.shopping_cart),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        body: Container(
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.fromLTRB(6, 20, 7, 20),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(20),
          ),
          child: products.when(
            data: (data) => ProductsGridview(products: data),
            error:
                (error, stackTrace) =>
                    AsyncErrorWidget(error: error.toString()),
            loading: () => ProductsGridview(isEnabled: true),
          ),
        ),
      ),
    );
  }
}
