import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:yoga_verse/core/utils/enums/connection_type.dart';

class ConnectionType {
  final MatConnectionType connectionType;
  final bool isConnected;
  final bool isTurnedOn;
  final bool isEnabled;
  final BluetoothDevice? device;

  ConnectionType({
    required this.connectionType,
    required this.isConnected,
    required this.isTurnedOn,
    required this.isEnabled,
    this.device,
  });
}
