import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/core/utils/enums/connection_type.dart';
import 'package:yoga_verse/features/connection%20to%20mat/data/model/connection_type_model.dart';
import 'package:yoga_verse/features/connection%20to%20mat/domain/entity/connection_type.dart';

final initConnectionStateProvider =
    Provider<Map<MatConnectionType, ConnectionTypeModel>>((ref) {
      return {
        MatConnectionType.bluetooth: ConnectionTypeModel(
          connectionType: MatConnectionType.bluetooth,
          isConnected: false,
          isTurnedOn: false,
          isEnabled: false,
        ),
        MatConnectionType.wifi: ConnectionTypeModel(
          connectionType: MatConnectionType.wifi,
          isConnected: false,
          isTurnedOn: false,
          isEnabled: false,
        ),
      };
    });
