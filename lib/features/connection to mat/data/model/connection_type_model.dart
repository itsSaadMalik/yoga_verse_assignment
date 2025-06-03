import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:yoga_verse/core/utils/enums/connection_type.dart';
import 'package:yoga_verse/features/connection%20to%20mat/domain/entity/connection_type.dart';

class ConnectionTypeModel extends ConnectionType {
  ConnectionTypeModel({
    required super.connectionType,
    required super.isConnected,
    required super.isTurnedOn,
    required super.isEnabled,
    super.device,
  });

  ConnectionTypeModel copyWith({
    MatConnectionType? connectionType,
    bool? isConnected,
    bool? isTurnedOn,
    bool? isEnabled,
    BluetoothDevice? device,
  }) => ConnectionTypeModel(
    connectionType: connectionType ?? this.connectionType,
    isConnected: isConnected ?? this.isConnected,
    isTurnedOn: isTurnedOn ?? this.isTurnedOn,
    isEnabled: isEnabled ?? this.isEnabled,
    device: device ?? this.device,
  );
}
