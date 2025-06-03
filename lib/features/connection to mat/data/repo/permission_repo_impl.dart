import 'package:permission_handler/permission_handler.dart';
import 'package:yoga_verse/features/connection%20to%20mat/domain/repository/permission_repo.dart';

class PermissionRepositoryImpl implements PermissionRepository {
  @override
  Future<bool> isBluetoothGranted() async {
    final permissionsResults = [
      await Permission.bluetooth.isGranted,
      await Permission.bluetoothScan.isGranted,
      await Permission.bluetoothConnect.isGranted,
      await Permission
          .locationWhenInUse
          .isGranted, // needed for BLE scan on many devices
    ];
    return permissionsResults.every((element) => element);
  }

  @override
  Future<bool> isWifiGranted() async {
    return await Permission.nearbyWifiDevices.isGranted;
  }

  @override
  Future<bool> requestBluetoothPermission() async {
    final permission =
        await [
          Permission.bluetoothScan,
          Permission.bluetoothConnect,

          Permission.locationWhenInUse, // needed for BLE scan on many devices
        ].request();
    final result = permission.entries.every(
      (element) => element.value.isGranted,
    );
    return result; //permission[Permission.bluetoothConnect]?.isGranted ?? false;
  }

  @override
  Future<bool> requestWiFiPermission() async {
    final permission =
        await [
          Permission.nearbyWifiDevices,
          Permission.locationWhenInUse,
        ].request();
    final permissionResult = permission.entries.every(
      (element) => element.value.isGranted,
    );
    return permissionResult;
  }
}
