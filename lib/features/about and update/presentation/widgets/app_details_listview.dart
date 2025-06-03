import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yoga_verse/features/app%20features/data/model/app_feature_model.dart';
import 'dart:developer' as d;

class AppDeatilsListView extends StatelessWidget {
  const AppDeatilsListView({
    super.key,
    this.isEnabled = false,
    this.appDetails,
  });
  final bool isEnabled;
  final Map<String, String>? appDetails;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isEnabled,
      child:
          appDetails != null
              ? DefaultTextStyle(
                style: Theme.of(context).textTheme.bodySmall ?? TextStyle(),
                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  itemCount: appDetails?.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final currentFeature = appDetails!.entries.elementAt(index);
                    return Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          spacing: 15,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${index + 1}. ${currentFeature.key}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(currentFeature.value),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
              : Text('no features to show'),
    );
  }
}
