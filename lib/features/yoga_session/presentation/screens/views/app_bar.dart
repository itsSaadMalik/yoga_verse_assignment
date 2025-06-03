import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/core/route_names.dart';
import 'package:yoga_verse/core/themes/app_theme.dart';
import 'package:yoga_verse/core/utils/enums/connection_type.dart';
import 'package:yoga_verse/core/utils/helpers/providers/connection_icon_data.dart';
import 'package:yoga_verse/features/connection%20to%20mat/presentation/providers/current_connection_provider.dart';

class SessionScreenAppBar extends ConsumerWidget {
  const SessionScreenAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connectionType = ref.watch(currentConnectionProvider);
    final isConnected = connectionType != MatConnectionType.none;
    final icon = ref.watch(connectionIconProvider(connectionType));
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(20, 15, 20, 10),
      height: 140,
      // width: 200,
      // height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      color: Colors.transparent,
      child: Row(
        spacing: 20,
        children: [
          // network/connection status
          if (isConnected)
            Row(
              spacing: 20,
              children: [
                Icon(icon, color: AppTheme.lightTheme.primaryColor),
                Container(
                  height: 40,
                  // width: 200,
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  decoration: BoxDecoration(
                    color: Colors.white, // AppTheme.lightTheme.primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    spacing: 20,
                    children: [
                      Text(
                        'mat status',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                      // battery status
                      Image.asset(
                        'assets/images/battery_status.png',
                        height: 18,
                      ),
                    ],
                  ),
                ),
              ],
            )
          else
            Text(
              'Please connect your Mat',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(),
            ),

          Spacer(),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteNames.about);
            },
            icon: Icon(Icons.info_outline_rounded),
          ),
        ],
      ),
    );
  }
}
