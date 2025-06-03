import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:yoga_verse/core/utils/enums/connection_type.dart';
import 'package:yoga_verse/features/connection%20to%20mat/domain/repository/network_state_repo.dart';

class NetworkStateRepositoryImpl implements NetworkStateRepository {
  @override
  Future<bool> isTurnedOn({required MatConnectionType connectionType}) async {
    try {
      final connectivity = await Connectivity().checkConnectivity();
      switch (connectionType) {
        // since connectivity().check() doesnt work for BT we will use FlutterBlePLus
        case MatConnectionType.bluetooth:
          final res = await FlutterBluePlus.adapterState.first;
          return (res == BluetoothAdapterState.on);
        // return connectivity.contains(ConnectivityResult.bluetooth);
        case MatConnectionType.wifi:
          return connectivity.contains(ConnectivityResult.wifi);
        case MatConnectionType.none:
          return false;
      }
    } catch (e) {
      return false;
    }
  }
}
