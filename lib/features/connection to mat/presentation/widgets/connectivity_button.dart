import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:developer' as d;
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yoga_verse/core/shared/widgets/error_message_snackbar.dart';
import 'package:yoga_verse/core/themes/app_colors.dart';
import 'package:yoga_verse/core/themes/app_theme.dart';
import 'package:yoga_verse/core/utils/enums/connection_type.dart';
import 'package:yoga_verse/features/connection%20to%20mat/presentation/providers/connection_state_provider.dart';
import 'package:yoga_verse/features/connection%20to%20mat/presentation/providers/current_connection_provider.dart';
import 'package:yoga_verse/features/connection%20to%20mat/presentation/providers/mat_connection_provider.dart';
import 'package:yoga_verse/features/connection%20to%20mat/presentation/providers/network_state.dart';
import 'package:yoga_verse/features/connection%20to%20mat/presentation/widgets/connect_to_mat_pop_up.dart';
import 'package:yoga_verse/features/connection%20to%20mat/presentation/widgets/nearby_bluetooth_devices.dart';
import 'package:yoga_verse/core/utils/helpers/providers/connection_icon_data.dart';
import 'package:yoga_verse/features/home/presentation/providers/connect_to_mat_provider.dart';

class ConnectivityButton extends ConsumerWidget {
  const ConnectivityButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentConnetionType = ref.watch(currentConnectionProvider);
    final matConnection = ref.watch(matConnectionProvider);
    final connectionState = ref.read(connectionStateProvider);
    final connectivityIcon = ref.watch(
      connectionIconProvider(currentConnetionType),
    );
    d.log(currentConnetionType.toString());
    return Container(
      padding: EdgeInsets.only(top: 0),
      alignment: Alignment.center,
      height: 165,
      width: 165,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: AppColors.secondaryLinearBackground,
        // boxShadow: [
        //   BoxShadow(
        //     color: const Color.fromARGB(255, 223, 255, 244),
        //     blurRadius: 10,
        //     spreadRadius: 2,
        //     offset: Offset(10, -10),
        //   ),
        //   BoxShadow(
        //     color: const Color.fromARGB(255, 223, 255, 244),
        //     blurRadius: 10,
        //     spreadRadius: 1,
        //     offset: Offset(-10, -10),
        //   ),
        //   BoxShadow(
        //     color: const Color.fromARGB(255, 233, 233, 233),
        //     blurRadius: 15,
        //     spreadRadius: 2,
        //     offset: Offset(0, 13),
        //   ),
        // ],
      ),
      child: PageView(
        clipBehavior: Clip.hardEdge,
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              child: Center(
                child:
                    currentConnetionType == (MatConnectionType.none)
                        ? Text(
                          'Connect',
                          style: AppTheme.lightTheme.textTheme.bodySmall,
                        )
                        : Column(
                          spacing: 15,
                          mainAxisAlignment: MainAxisAlignment.center,
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            if (currentConnetionType !=
                                    MatConnectionType.none &&
                                connectivityIcon != null)
                              Icon(
                                connectivityIcon,
                                color: Colors.grey,
                                size: 27,
                              ),
                            Text(
                              'Disconnect',
                              style: AppTheme.lightTheme.textTheme.bodySmall,
                            ),
                          ],
                        ),
              ),
              onTap: () async {
                if (currentConnetionType == MatConnectionType.none) {
                  // get a connection type form user
                  final selectedConnectionType =
                      await showDialog<MatConnectionType>(
                        context: context,
                        builder: (context) => ConnectToMatPopUp(),
                      );
                  if (selectedConnectionType != null) {
                    // check and get user permision for selected mode
                    final userPermission = await ref
                        .read(connectToMatProvider)
                        .checkUserPermissions(
                          connectionType: selectedConnectionType,
                        );
                    final isNetworkAvailable = await ref
                        .watch(networkStateProvider)
                        .isTurnedOn(connectionType: selectedConnectionType);
                    d.log(
                      'networkstate $isNetworkAvailable $selectedConnectionType',
                    );
                    if (!isNetworkAvailable && context.mounted) {
                      errorHandingSnackBar(
                        context: context,
                        errorMessage:
                            'please turn-on your ${selectedConnectionType.name}',
                      );
                      return;
                    } else if (userPermission.isSuccessful) {
                      // if the selected connection is bluetooth
                      if (selectedConnectionType ==
                              MatConnectionType.bluetooth &&
                          context.mounted) {
                        BluetoothDevice? deviceId;
                        deviceId = await showDialog<BluetoothDevice>(
                          context: context,
                          builder: (context) => NearbyBluetoothDevices(),
                        );
                        if (deviceId != null) {
                          ref
                              .read(connectionStateProvider.notifier)
                              .updateConnectionState(
                                connectionType: selectedConnectionType,
                                //
                                updateValue: true,
                                deviceId: deviceId.remoteId.str,
                                // currentConnetionStatus ==
                                // MatConnectionType.none,
                              );
                          // update the type of current connection established with Mat
                        }
                      }
                      // if the selected connection is wifi
                      else {
                        ref
                            .read(connectionStateProvider.notifier)
                            .updateConnectionState(
                              connectionType: selectedConnectionType,
                              updateValue: true,
                            );
                      }
                    }
                    // update the curernt connetion type with mat to  selectedConnectionType

                    ref.read(currentConnectionProvider.notifier).state =
                        selectedConnectionType;
                  }
                } else {
                  switch (currentConnetionType) {
                    case MatConnectionType.bluetooth:
                      matConnection.disConnectMat(
                        device:
                            connectionState[MatConnectionType.bluetooth]
                                ?.device,
                      );
                      ref
                          .read(connectionStateProvider.notifier)
                          .updateConnectionState(
                            connectionType: currentConnetionType,
                            updateValue: false,
                            deviceId: null,
                          );
                    case MatConnectionType.wifi:
                      // some disconnect logic

                      ref
                          .read(connectionStateProvider.notifier)
                          .updateConnectionState(
                            connectionType: currentConnetionType,
                            updateValue: false,
                          );
                    case MatConnectionType.none:
                      break;
                  }
                  // update the curernt connetion type with mat to none i.e no connection
                  ref.read(currentConnectionProvider.notifier).state =
                      MatConnectionType.none;
                }
              },
            ),
          ),
          InkWell(
            child: Center(child: Text('data')),
            onTap: () {
              d.log('disconnect');
            },
          ),
        ],
      ),
    );
  }
}
