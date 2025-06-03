import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/core/route_names.dart';
import 'package:yoga_verse/core/shared/widgets/async_error_widget.dart';
import 'package:yoga_verse/core/shared/widgets/error_message_snackbar.dart';
import 'package:yoga_verse/core/shared/widgets/loading_dailog.dart';
import 'package:yoga_verse/core/themes/app_colors.dart';
import 'package:yoga_verse/features/about%20and%20update/presentation/providers/about_app_usecase_provider.dart';
import 'package:yoga_verse/features/about%20and%20update/presentation/providers/mat_updates_provider.dart';
import 'package:yoga_verse/features/about%20and%20update/presentation/providers/mat_version_provider.dart';

class MatUpdatePopUp extends ConsumerStatefulWidget {
  const MatUpdatePopUp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MatUpdatePopUpState();
}

class _MatUpdatePopUpState extends ConsumerState<MatUpdatePopUp> {
  @override
  Widget build(BuildContext context) {
    final getVersion = ref.watch(matUpdatesProvider);

    return AlertDialog(
      backgroundColor: Colors.white,
      content: DefaultTextStyle(
        style: Theme.of(context).textTheme.bodySmall ?? TextStyle(),
        child: SizedBox(
          height: 170,
          child: getVersion.when(
            data:
                (data) =>
                    data != null
                        ? Column(
                          spacing: 10,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('version : ${data.updateVersion}'),
                            Text(
                              'date : ${data.date.toString().substring(0, 10)}',
                            ),
                            SizedBox(height: 25),
                            ElevatedButton(
                              onPressed: () async {
                                final result = await ref
                                    .read(matVersionHandlerProvider.notifier)
                                    .udpate(updatedVersion: data);
                                if (context.mounted) {
                                  Navigator.of(context).pop();
                                  errorHandingSnackBar(
                                    context: context,
                                    errorMessage:
                                        "Mat's software updated to version ${data.updateVersion}",
                                  );
                                  // Navigator.of(context).pushNamedAndRemoveUntil(
                                  //   RouteNames.home,
                                  //   (route) => false,
                                  // );
                                }
                              },
                              child: Text('update now'),
                            ),
                          ],
                        )
                        : Center(
                          child: Text(
                            'Your Mat is up-to-date',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
            error:
                (error, stackTrace) =>
                    AsyncErrorWidget(error: error.toString()),
            loading:
                () => Column(
                  spacing: 35,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: AppColors.applightThemePrimaryColor,
                    ),
                    Text('checking for updates..'),
                  ],
                ),
          ),
        ),
      ),
    );
  }
}
