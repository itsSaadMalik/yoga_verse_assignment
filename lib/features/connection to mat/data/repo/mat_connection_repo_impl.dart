import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:yoga_verse/features/connection%20to%20mat/data/data%20source/connection_data_src_impl.dart';
import 'package:yoga_verse/features/connection%20to%20mat/domain/data%20source/connection_data_src.dart';
import 'package:yoga_verse/features/connection%20to%20mat/domain/repository/mat_connection_repo.dart';

class MatConnectionRepositoryImpl implements MatConnectionRepository {
  final ConnectionDataSourceImpl _dataSource;

  MatConnectionRepositoryImpl({required ConnectionDataSourceImpl dataSource})
    : _dataSource = dataSource;

  @override
  Future<void> connectMat({required BluetoothDevice device}) async {
    return _dataSource.connect(device: device);
  }

  @override
  Future<void> disConnectMat({BluetoothDevice? device}) async {
    return _dataSource.disConnect(device: device);
  }

  @override
  Stream<List<BluetoothDevice>> get getScanResults =>
      _dataSource.getScanResults;

  @override
  Future<void> startScan() async {
    return _dataSource.startScan();
  }

  @override
  Future<bool> getMatConnectionState({required BluetoothDevice device}) async {
    try {
      final connectionState = device.isConnected;
      return connectionState;
    } catch (e) {
      return false;
    }
  }
}
