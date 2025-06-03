import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:yoga_verse/core/utils/enums/connection_type.dart';
import 'package:yoga_verse/features/connection%20to%20mat/data/model/connection_result_model.dart';
import 'package:yoga_verse/features/connection%20to%20mat/data/repo/mat_connection_repo_impl.dart';
import 'package:yoga_verse/features/connection%20to%20mat/data/repo/permission_repo_impl.dart';

class ConnectToMatUseCase {
  final PermissionRepositoryImpl permissionRepositoryImpl;
  final MatConnectionRepositoryImpl matConnectionRepositoryImpl;

  ConnectToMatUseCase({
    required this.permissionRepositoryImpl,
    required this.matConnectionRepositoryImpl,
  });
  Future<ConnectionResultModel> checkUserPermissions({
    required MatConnectionType connectionType,
  }) async {
    try {
      switch (connectionType) {
        // if bt is not granted
        case MatConnectionType.bluetooth:
          final isGranted = await permissionRepositoryImpl.isBluetoothGranted();
          if (!isGranted) {
            final newRequest =
                await permissionRepositoryImpl.requestBluetoothPermission();
            if (!newRequest) {
              return ConnectionResultModel(
                isSuccessful: newRequest,
                message: 'please grant bluetooth permssion',
              );
            }
          }

          return ConnectionResultModel(
            isSuccessful: true,
            message: 'Connection sucessfull',
          );

        case MatConnectionType.wifi:
          final isGranted = await permissionRepositoryImpl.isWifiGranted();
          if (!isGranted) {
            final newRequest =
                await permissionRepositoryImpl.requestWiFiPermission();
            if (!newRequest) {
              return ConnectionResultModel(
                isSuccessful: newRequest,
                message: 'please grant wifi permssion',
              );
            }
          }
          return ConnectionResultModel(
            isSuccessful: true,
            message: 'wifi is enabled',
          );

        case MatConnectionType.none:
          return ConnectionResultModel(isSuccessful: false);
      }
    } catch (e) {
      return ConnectionResultModel(
        isSuccessful: false,
        message: 'some error occured',
      );
    }
  }

  Future<ConnectionResultModel> connectToMatUsecase({
    required MatConnectionType connectionType,
    required BluetoothDevice device,
  }) async {
    try {
      switch (connectionType) {
        // if bt is not granted
        case MatConnectionType.bluetooth:
          final isGranted = await permissionRepositoryImpl.isBluetoothGranted();
          if (!isGranted) {
            final newRequest =
                await permissionRepositoryImpl.requestBluetoothPermission();
            if (!newRequest) {
              return ConnectionResultModel(
                isSuccessful: newRequest,
                message: 'please grant bluetooth permssion',
              );
            }
          }
          await matConnectionRepositoryImpl.connectMat(device: device);

          return ConnectionResultModel(
            isSuccessful: true,
            message: 'Connection sucessfull',
          );

        case MatConnectionType.wifi:
          final isGranted = await permissionRepositoryImpl.isWifiGranted();
          if (!isGranted) {
            final newRequest =
                await permissionRepositoryImpl.requestWiFiPermission();
            if (!newRequest) {
              return ConnectionResultModel(
                isSuccessful: newRequest,
                message: 'please grant wifi permssion',
              );
            }
          }
          return ConnectionResultModel(
            isSuccessful: true,
            message: 'Connection sucessfull',
          );

        case MatConnectionType.none:
          return ConnectionResultModel(isSuccessful: false);
      }
    } catch (e) {
      return ConnectionResultModel(
        isSuccessful: false,
        message: 'some error occured',
      );
    }
  }
}
