import 'package:flutter/material.dart';
import 'package:yoga_verse/core/utils/enums/connection_type.dart';

class ConnectivityIcons {
  static final btIcon = Icons.bluetooth_connected_rounded;
  // static final btIcon = Icons.bluetooth_rounded;

  static final wifiIcon = Icons.wifi_rounded;

  static IconData? connectivityIcon(MatConnectionType connectionType) {
    switch (connectionType) {
      case MatConnectionType.bluetooth:
        return btIcon;
      case MatConnectionType.wifi:
        return wifiIcon;
      case MatConnectionType.none:
        return null;
    }
  }
}
