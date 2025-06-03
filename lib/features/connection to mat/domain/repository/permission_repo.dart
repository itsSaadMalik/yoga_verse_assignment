abstract class PermissionRepository {
  Future<bool> isBluetoothGranted();
  Future<bool> isWifiGranted();
  Future<bool> requestBluetoothPermission();
  Future<bool> requestWiFiPermission();
}
