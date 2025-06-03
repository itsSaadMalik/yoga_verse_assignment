import 'package:flutter_blue_plus/flutter_blue_plus.dart';

abstract class ConnectionDataSource {
  Future<void> startScan();
  Future<void> stopScan();

  Stream<List<BluetoothDevice>> get getScanResults;

  Future<void> connect({required BluetoothDevice device});
  Future<void> disConnect({BluetoothDevice device});
}
