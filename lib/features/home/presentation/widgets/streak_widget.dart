import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:yoga_verse/core/themes/app_colors.dart';
import 'package:yoga_verse/core/themes/app_theme.dart';
import 'package:yoga_verse/features/home/data/model/user_home_data_model.dart';

class ShowCaseWidgets extends StatelessWidget {
  const ShowCaseWidgets({super.key, this.isEnabled = false, this.userHomeData});
  final bool isEnabled;
  final UserHomeDataModel? userHomeData;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: PulseEffect(
        from: Colors.white,
        to: const Color.fromARGB(255, 201, 201, 201),
      ),
      containersColor: AppColors.applightThemePrimaryColor,
      enabled: isEnabled,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 130,
            width: 130,
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.fromLTRB(15, 15, 5, 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: AppTheme.lightTheme.primaryColor,
            ),
            child: Column(
              spacing: 15,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Total sessions',
                  style: AppTheme.lightTheme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    spacing: 5,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        userHomeData?.totalSessions.toString() ?? '0',
                        style: AppTheme.lightTheme.textTheme.bodyLarge
                            ?.copyWith(color: Colors.black),
                      ),
                      Text(
                        'sessions',
                        style: AppTheme.lightTheme.textTheme.bodyLarge
                            ?.copyWith(color: Colors.black, fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 100,
            width: 130,
            padding: EdgeInsets.fromLTRB(15, 15, 5, 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: AppTheme.lightTheme.primaryColor,
            ),
            child: Column(
              spacing: 15,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Streak',
                  style: AppTheme.lightTheme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    spacing: 5,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        userHomeData?.streak.toString() ?? '0',
                        style: AppTheme.lightTheme.textTheme.bodyLarge
                            ?.copyWith(color: Colors.black),
                      ),
                      Text(
                        'days',
                        style: AppTheme.lightTheme.textTheme.bodyLarge
                            ?.copyWith(color: Colors.black, fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
