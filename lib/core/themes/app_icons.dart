import 'package:flutter/material.dart';

class AppIcons {
  static Icon bluetoothIcons({double? size, Color? color}) =>
      Icon(Icons.bluetooth_rounded, color: color, size: size);
  static Icon get wifiIcon => Icon(
    Icons.wifi_rounded,
    color: const Color.fromARGB(255, 151, 151, 151),
    size: 15,
  );
}
