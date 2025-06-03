import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yoga_verse/core/themes/app_colors.dart';
import 'package:yoga_verse/features/products/data/model/product_model.dart';

class ProductsGridview extends StatelessWidget {
  const ProductsGridview({super.key, this.isEnabled = false, this.products});
  final bool isEnabled;
  final List<ProductModel>? products;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isEnabled,
      child:
          products != null
              ? GridView.builder(
                padding: EdgeInsets.fromLTRB(2, 15, 2, 10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .63,
                  crossAxisSpacing: 19,
                  mainAxisSpacing: 10,
                ),
                itemCount: products?.length,
                itemBuilder: (context, index) {
                  final currentProduct = products?.elementAt(index);
                  return InkWell(
                    onTap:
                        () => launchUrl(Uri.parse(currentProduct.productLink)),
                    child: DefaultTextStyle(
                      style:
                          Theme.of(
                            context,
                          ).textTheme.bodySmall?.copyWith(fontSize: 11) ??
                          TextStyle(),
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        padding: EdgeInsets.fromLTRB(10, 25, 10, 15),
                        height: 230,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          // gradient: AppColors.secondaryLinearBackground,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 15,
                          children: [
                            Image.network(
                              currentProduct!.pictureLink,
                              height: 80,
                            ),
                            Text(
                              currentProduct!.name,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Rs.${currentProduct.price.toString()}',
                              style: TextStyle(fontWeight: FontWeight.w800),
                              textAlign: TextAlign.center,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: Theme.of(
                                context,
                              ).elevatedButtonTheme.style?.copyWith(
                                padding: WidgetStatePropertyAll(
                                  EdgeInsets.all(8),
                                ),
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              child: Text('add to cart'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
              : Text('no products'),
    );
  }
}
