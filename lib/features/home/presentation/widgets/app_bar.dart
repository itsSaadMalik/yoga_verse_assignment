import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/core/themes/app_theme.dart';
import 'package:yoga_verse/features/auth/presentation/provider/user_provider.dart';
import 'package:yoga_verse/features/connection%20to%20mat/presentation/providers/connection_state_provider.dart';
import 'package:yoga_verse/features/connection%20to%20mat/presentation/widgets/connections_status_indicators.dart';

class HomeAppBar extends ConsumerWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(userProvider).value;
    return Container(
      padding: EdgeInsets.only(left: 10, top: 10, right: 8),
      child: Row(
        spacing: 10,
        children: [
          ConnectionsStatusIndicators(),
          Spacer(),
          Text(
            'Hi!  ${user?.name}',
            style: AppTheme.lightTheme.textTheme.bodySmall,
          ),
          Container(
            height: 40,
            width: 40,
            margin: EdgeInsets.only(top: 0),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/lotus.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
