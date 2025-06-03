import 'package:flutter_blue_plus/flutter_blue_plus.dart';

abstract class MatConnectionRepository {
  Future<bool> getMatConnectionState({required BluetoothDevice device});
  Future<void> startScan();
  Future<void> connectMat({required BluetoothDevice device});
  Future<void> disConnectMat({required BluetoothDevice device});

  Stream<List<BluetoothDevice>> get getScanResults;
}
