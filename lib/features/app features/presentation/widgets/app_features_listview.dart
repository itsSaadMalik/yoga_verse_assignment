import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yoga_verse/features/app%20features/data/model/app_feature_model.dart';
import 'dart:developer' as d;

class AppFeaturesListView extends StatelessWidget {
  const AppFeaturesListView({super.key, this.isEnabled = false, this.features});
  final bool isEnabled;
  final List<AppFeatureModel>? features;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isEnabled,
      child:
          features != null
              ? ListView.builder(
                itemCount: features?.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final currentFeature = features!.elementAt(index);
                  return Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: InkWell(
                      onTap: () {
                        try {
                          d.log(currentFeature.productLink);
                          launchUrl(Uri.parse(currentFeature.productLink));
                        } catch (e) {
                          d.log(e.toString());
                        }
                      },
                      child: DefaultTextStyle(
                        style:
                            Theme.of(context).textTheme.bodySmall ??
                            TextStyle(),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: EdgeInsets.all(15),
                          child: Row(
                            spacing: 15,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Card(
                                margin: EdgeInsets.zero,
                                clipBehavior: Clip.hardEdge,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Image.network(
                                  currentFeature.pictureLink,
                                  height: 110,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Column(
                                    spacing: 15,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        currentFeature.featureName,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(currentFeature.description),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
              : Text('no features to show'),
    );
  }
}
