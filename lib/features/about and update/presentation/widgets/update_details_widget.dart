import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:yoga_verse/features/about%20and%20update/data/model/mat_version_model.dart';
import 'package:yoga_verse/features/about%20and%20update/presentation/providers/about_app_usecase_provider.dart';
import 'package:yoga_verse/features/about%20and%20update/presentation/widgets/mat_update_pop_up.dart';

class UpdateDetailsWidget extends ConsumerWidget {
  const UpdateDetailsWidget({
    super.key,
    this.isEnabled = false,
    this.matVersion,
  });
  final bool isEnabled;
  final MatVersionModel? matVersion;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint(matVersion?.description);
    return Skeletonizer(
      enabled: isEnabled,
      child: Column(
        spacing: 15,
        children: [
          ElevatedButton(
            onPressed: () async {
              final update = await showDialog<MatVersionModel?>(
                context: context,
                builder: (context) => MatUpdatePopUp(),
              );
              // await ref.read(aboutAppUsecaseProvider).matUpdate();
            },
            child: Text('check for update'),
          ),
          Text(
            'version: ${matVersion?.updateVersion ?? 'no data available'}',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
