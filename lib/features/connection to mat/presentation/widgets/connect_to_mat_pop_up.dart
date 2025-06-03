import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/core/themes/app_theme.dart';
import 'package:yoga_verse/core/utils/enums/connection_type.dart';
import 'package:yoga_verse/features/connection%20to%20mat/presentation/providers/popup_connection_type_provider.dart';

class ConnectToMatPopUp extends ConsumerWidget {
  const ConnectToMatPopUp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connectionType = ref.watch(popUpconnetionTypeProvider);

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      insetPadding: EdgeInsets.all(15),
      alignment: Alignment.bottomCenter,
      contentPadding: EdgeInsets.fromLTRB(35, 30, 35, 30),
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      clipBehavior: Clip.hardEdge,

      actionsAlignment: MainAxisAlignment.center,
      title: Text('Select connection type'),
      titleTextStyle: TextStyle(
        fontSize: 15.5,
        color: const Color.fromARGB(255, 73, 73, 73),
      ),
      content: Container(
        clipBehavior: Clip.hardEdge,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 197, 197, 197),
            width: .41,
          ),
          // boxShadow: [
          //   BoxShadow(
          //     color: const Color.fromARGB(255, 226, 226, 226),
          //     blurRadius: 8,
          //     spreadRadius: 1.7,
          //   ),
          // ],
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        height: 100,
        width: MediaQuery.sizeOf(context).width,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(color: Colors.grey, width: .2),
                    ),
                    color:
                        connectionType == MatConnectionType.wifi
                            ? AppTheme.lightTheme.primaryColor
                            : Colors.transparent,
                  ),
                  // clipBehavior: Clip.hardEdge,
                  height: MediaQuery.sizeOf(context).height,
                  child: Icon(
                    Icons.wifi_rounded,
                    size: 45,
                    weight: .31,
                    color:
                        connectionType == MatConnectionType.wifi
                            ? Colors.white
                            : const Color.fromARGB(255, 68, 68, 68),
                  ),
                ),
                onTap: () {
                  ref.read(popUpconnetionTypeProvider.notifier).state =
                      MatConnectionType.wifi;
                },
              ),
            ),
            Expanded(
              child: InkWell(
                child: Container(
                  // clipBehavior: Clip.hardEdge,
                  color:
                      connectionType == MatConnectionType.bluetooth
                          ? AppTheme.lightTheme.primaryColor
                          : Colors.transparent,
                  height: MediaQuery.sizeOf(context).height,
                  child: Icon(
                    Icons.bluetooth_rounded,
                    size: 45,
                    weight: .31,
                    color:
                        connectionType == MatConnectionType.bluetooth
                            ? Colors.white
                            : const Color.fromARGB(255, 65, 65, 65),
                  ),
                ),
                onTap: () {
                  ref.read(popUpconnetionTypeProvider.notifier).state =
                      MatConnectionType.bluetooth;
                },
              ),
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(connectionType);
          },
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              AppTheme.lightTheme.primaryColor,
            ),
            foregroundColor: WidgetStatePropertyAll(Colors.white),
            elevation: WidgetStatePropertyAll(0),
          ),
          child: Text('Done'),
        ),
      ],
    );
  }
}
// Future connectToMatPopUp(BuildContext context) async {
//   return showDialog(
//     context: context,
//     builder:
//         (context) => 
//     // anchorPoint: Offset(0, 0),
//   );
// }
