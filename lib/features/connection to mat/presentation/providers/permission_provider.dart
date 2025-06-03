import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:yoga_verse/core/utils/enums/connection_type.dart';

final userPermissionSettingProvider =
    FutureProvider.family<bool, MatConnectionType>((
      ref,
      MatConnectionType connectionType,
    ) async {
      if (connectionType == MatConnectionType.bluetooth) {
        return await Permission.bluetooth.isGranted;
      } else if (connectionType == MatConnectionType.wifi) {
        return await Permission.nearbyWifiDevices.isGranted;
      }
      return false;
    });
