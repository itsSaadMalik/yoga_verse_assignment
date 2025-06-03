import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/core/utils/enums/connection_type.dart';
import 'package:yoga_verse/core/utils/helpers/connectivity_icons.dart';

final connectionIconProvider =
    StateProvider.family<IconData?, MatConnectionType>((
      ref,
      MatConnectionType connectionType,
    ) {
      return ConnectivityIcons.connectivityIcon(connectionType);
      // switch (connectionType) {
      //   case MatConnectionType.bluetooth:
      //     return AppIcons.bluetoothIcons(
      //       color: const Color.fromARGB(255, 151, 151, 151),
      //     );
      //   case MatConnectionType.wifi:
      //     return AppIcons.wifiIcon();
      //   case MatConnectionType.none:
      //     return null;
      // }
    });
