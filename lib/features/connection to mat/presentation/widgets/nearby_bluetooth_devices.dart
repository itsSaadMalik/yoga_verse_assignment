import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/core/themes/app_theme.dart';
import 'package:yoga_verse/features/connection%20to%20mat/presentation/providers/mat_connection_provider.dart';
// import 'dart:developer' as d;

class NearbyBluetoothDevices extends ConsumerStatefulWidget {
  const NearbyBluetoothDevices({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NearbyBluetoothDevicesState();
}

class _NearbyBluetoothDevicesState
    extends ConsumerState<NearbyBluetoothDevices> {
  @override
  void initState() {
    super.initState();
    // start the scan
    ref.read(matConnectionProvider).startScan();
  }

  @override
  Widget build(BuildContext context) {
    final nearbyDevice = ref.watch(matConnectionProvider).getScanResults;
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      insetPadding: EdgeInsets.all(15),
      alignment: Alignment.bottomCenter,
      contentPadding: EdgeInsets.fromLTRB(35, 30, 35, 30),
      backgroundColor: const Color.fromARGB(255, 248, 248, 248),
      clipBehavior: Clip.hardEdge,

      actionsAlignment: MainAxisAlignment.center,
      title: Text('Select device'),
      titleTextStyle: TextStyle(
        fontSize: 15.5,
        color: const Color.fromARGB(255, 73, 73, 73),
      ),
      content: Container(
        color: const Color.fromARGB(255, 245, 245, 245),
        height: 300,
        width: 300,
        child: StreamBuilder(
          stream: nearbyDevice,
          builder: (context, snapshot) {
            final devices = snapshot.data;
            // d.log(devices.toString());

            return ListView.builder(
              padding: EdgeInsets.all(5),
              itemCount: devices?.length ?? 0,
              itemBuilder: (context, index) {
                final currentDevice = devices?.elementAt(index);
                return InkWell(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromARGB(255, 233, 233, 233),
                    ),
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      currentDevice?.advName ??
                          currentDevice?.remoteId.str ??
                          '',
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop(devices?.elementAt(index));
                  },
                );
              },
            );
          },
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(null);
          },
          style: AppTheme.lightTheme.elevatedButtonTheme.style,
          child: Text('Cancel'),
        ),
      ],
    );
  }
}

// class NearbyBluetoothDevices extends ConsumerWidget {
//   const NearbyBluetoothDevices({super.key});

//   @override
//   // ref.read(matConnectionProvider).startScan();
//   Widget build(BuildContext context, WidgetRef ref) {
//     final nearbyDevice = ref.watch(matConnectionProvider).getScanResults;
//     return AlertDialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       insetPadding: EdgeInsets.all(15),
//       alignment: Alignment.bottomCenter,
//       contentPadding: EdgeInsets.fromLTRB(35, 30, 35, 30),
//       backgroundColor: const Color.fromARGB(255, 248, 248, 248),
//       clipBehavior: Clip.hardEdge,

//       actionsAlignment: MainAxisAlignment.center,
//       title: Text('Select connection type'),
//       titleTextStyle: TextStyle(
//         fontSize: 15.5,
//         color: const Color.fromARGB(255, 73, 73, 73),
//       ),
//       content: Container(
//         color: const Color.fromARGB(255, 245, 245, 245),
//         height: 600,
//         width: 300,
//         child: StreamBuilder(
//           stream: nearbyDevice,
//           builder: (context, snapshot) {
//             final devices = snapshot.data;
//             d.log(devices.toString());

//             return ListView.builder(
//               itemCount: devices?.length ?? 0,
//               itemBuilder:
//                   (context, index) => InkWell(
//                     child: Container(
//                       color: const Color.fromARGB(255, 85, 84, 84),
//                       child: Text(devices?.elementAt(index).advName ?? 'na'),
//                     ),
//                     onTap: () {
//                       Navigator.of(context).pop(devices?.elementAt(index));
//                     },
//                   ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
