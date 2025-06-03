import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/core/shared/widgets/async_error_widget.dart';
import 'package:yoga_verse/core/widgets/gradient_app_background.dart';
import 'package:yoga_verse/features/about%20and%20update/presentation/providers/app_details_provider.dart';
import 'package:yoga_verse/features/about%20and%20update/presentation/providers/mat_version_provider.dart';
import 'package:yoga_verse/features/about%20and%20update/presentation/widgets/app_details_listview.dart';
import 'package:yoga_verse/features/about%20and%20update/presentation/widgets/update_details_widget.dart';
import 'package:yoga_verse/features/app%20features/presentation/widgets/app_features_listview.dart';

class AboutApp extends ConsumerWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appDetails = ref.watch(appDetailsProvider);
    final currentVersion = ref.watch(matVersionHandlerProvider);
    debugPrint('why ${currentVersion?.updateVersion}');
    return GradientAppBackground(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          leadingWidth: 30,
          title: Text('About'),
          centerTitle: true,
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
          child: SingleChildScrollView(
            child: Column(
              spacing: 15,
              children: [
                Text(
                  'Experience a smarter way to practice yoga with our SmartMat.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    wordSpacing: 1,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Designed to seamlessly connect with your mobile device, it tracks your posture, pressure points, and session progress in real time — helping you improve alignment and focus with every pose.',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(fontSize: 11, height: 1.8),
                  strutStyle: StrutStyle(),
                  softWrap: true,
                  textAlign: TextAlign.left,
                ),
                appDetails.when(
                  data: (data) => AppDeatilsListView(appDetails: data),
                  error:
                      (error, stackTrace) =>
                          AsyncErrorWidget(error: error.toString()),
                  loading: () => AppFeaturesListView(isEnabled: true),
                ),
                SizedBox(height: 30),
                UpdateDetailsWidget(matVersion: currentVersion),
                // currentVersion.when(
                //   data: (data) => UpdateDetailsWidget(matVersion: data),
                //   error:
                //       (error, stackTrace) =>
                //           AsyncErrorWidget(error: error.toString()),
                //   loading: () => UpdateDetailsWidget(isEnabled: true),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// Experience a smarter way to practice yoga with our Smart Yoga Mat. Designed to seamlessly connect with your mobile device, it tracks your posture, pressure points, and session progress in real time — helping you improve alignment and focus with every pose.

// Sync, stretch, and evolve. Whether you're a beginner or an expert, the mat offers guided feedback through the companion app, turning every session into a personalized journey toward better flexibility, balance, and mindfulness.
