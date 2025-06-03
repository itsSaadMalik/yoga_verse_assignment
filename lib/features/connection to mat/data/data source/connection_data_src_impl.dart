import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:yoga_verse/features/connection%20to%20mat/domain/data%20source/connection_data_src.dart';
import 'dart:developer' as d;

class ConnectionDataSourceImpl implements ConnectionDataSource {
  @override
  Future<void> connect({required BluetoothDevice device}) async {
    return device.connect();
  }

  @override
  Future<void> disConnect({BluetoothDevice? device}) async {
    if (device != null) {
      return device.disconnect();
    }
  }

  @override
  Stream<List<BluetoothDevice>> get getScanResults => FlutterBluePlus
      .scanResults
      .map((results) => results.map((r) => r.device).toList());

  @override
  Future<void> startScan() async {
    d.log('scan started');
    FlutterBluePlus.startScan(timeout: Duration(seconds: 15));
    //  ?debugging lines
    // FlutterBluePlus.scanResults.listen((results) {
    //   for (ScanResult r in results) {
    //     d.log('Device found: ${r.device.name} (${r.device.id})');
    //   }
    // });

    d.log('scan ended');

    return;
  }

  @override
  Future<void> stopScan() async {
    await FlutterBluePlus.stopScan();
    return;
  }
}
