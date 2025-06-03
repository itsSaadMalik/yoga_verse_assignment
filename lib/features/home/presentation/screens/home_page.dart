import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/core/themes/app_colors.dart';
import 'package:yoga_verse/core/widgets/gradient_app_background.dart';
import 'package:yoga_verse/features/home/presentation/providers/drawer_provider.dart';
import 'package:yoga_verse/features/home/presentation/views/drawer_widget.dart';
import 'package:yoga_verse/features/home/presentation/widgets/app_bar.dart';
import 'package:yoga_verse/features/home/presentation/widgets/features_section.dart';
import 'package:yoga_verse/features/home/presentation/widgets/mat_info_widget.dart';
import 'dart:developer' as d;

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final drawerState = ref.watch(drawerStateProvider);
    // d.log((-(pi / 2)).toString());
    return GradientAppBackground(
      child: Scaffold(
        key: drawerState,
        drawerScrimColor: Colors.white.withValues(alpha: .35),
        endDrawer: DrawerWidget(),

        // drawer
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(12, 10, 10, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeAppBar(),
                SizedBox(height: 35),
                MatInfoWidget(),
                SizedBox(height: 70),
                FeaturesSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// Positioned(
                              //   top: 5,
                              //   left: 75,
                              //   child: InkWell(
                              //     child: CircleAvatar(
                              //       radius: 30,
                              //       backgroundColor:
                              //           AppTheme.lightTheme.primaryColor,

                              //       child: Icon(
                              //         Icons.play_arrow_rounded,
                              //         color: Colors.white,
                              //         size: 50,
                              //       ),
                              //     ),
                              //   ),
                              // ),
