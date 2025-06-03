import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/core/shared/widgets/async_error_widget.dart';
import 'package:yoga_verse/core/widgets/gradient_app_background.dart';
import 'package:yoga_verse/features/app%20features/presentation/providers/all_products_provider.dart';
import 'package:yoga_verse/features/app%20features/presentation/widgets/app_features_listview.dart';

class AppFeatures extends ConsumerWidget {
  const AppFeatures({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final features = ref.watch(appFeaturesProvider);
    return GradientAppBackground(
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 30,
          title: Text('App Features'),
          titleTextStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 17,
          ),
          actions: [
            // IconButton(
            //   onPressed:
            //       () => Navigator.pushNamed(context, RouteNames.features),
            //   icon: Icon(Icons.shopping_cart),
            // ),
          ],
        ),
        backgroundColor: Colors.transparent,
        body: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.fromLTRB(6, 20, 7, 20),
          decoration: BoxDecoration(
            // color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(20),
          ),
          child: features.when(
            data: (data) => AppFeaturesListView(features: data),
            error:
                (error, stackTrace) =>
                    AsyncErrorWidget(error: error.toString()),
            loading: () => AppFeaturesListView(isEnabled: true),
          ),
        ),
      ),
    );
  }
}
