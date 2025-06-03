import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/core/themes/app_theme.dart';
import 'package:yoga_verse/core/utils/enums/connection_type.dart';
import 'package:yoga_verse/features/connection%20to%20mat/presentation/providers/connection_state_provider.dart';

class ConnectionsStatusIndicators extends ConsumerWidget {
  const ConnectionsStatusIndicators({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wifiStatus =
        ref.watch(connectionStateProvider)[MatConnectionType.wifi];
    final bluetoothStatus =
        ref.watch(connectionStateProvider)[MatConnectionType.bluetooth];

    return Container(
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        color:
            AppTheme
                .lightTheme
                .primaryColor, // const Color.fromARGB(255, 136, 136, 136),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        spacing: 8,
        children: [
          Icon(
            Icons.wifi_rounded,
            color:
                (wifiStatus?.isConnected ?? false) ? Colors.white : Colors.grey,
          ),
          Icon(
            Icons.bluetooth,
            color:
                (bluetoothStatus?.isConnected ?? false)
                    ? Colors.white
                    : Colors.grey,
          ),
        ],
      ),
    );
  }
}
