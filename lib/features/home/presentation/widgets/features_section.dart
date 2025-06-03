import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/core/route_names.dart';
import 'package:yoga_verse/core/themes/app_theme.dart';
import 'package:yoga_verse/core/utils/enums/connection_type.dart';
import 'package:yoga_verse/features/connection%20to%20mat/presentation/providers/current_connection_provider.dart';
import 'package:yoga_verse/features/connection%20to%20mat/presentation/widgets/connectivity_button.dart';
import 'package:yoga_verse/features/home/presentation/providers/drawer_provider.dart';
import 'package:yoga_verse/features/home/presentation/widgets/semi_circle.dart';
import 'package:yoga_verse/features/home/presentation/views/user_data_showcase_view.dart';

class FeaturesSection extends ConsumerStatefulWidget {
  const FeaturesSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FeaturesSectionState();
}

class _FeaturesSectionState extends ConsumerState<FeaturesSection> {
  @override
  Widget build(BuildContext context) {
    final connectivity = ref.watch(currentConnectionProvider);
    return Stack(
      children: [
        UserDataShowcaseWidget(),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(
            //   height: 300,
            //   child: Column(
            //     mainAxisSize: MainAxisSize.max,
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [StreakDisplayWidget(), StreakDisplayWidget()],
            //   ),
            // ),
            SizedBox(height: 300, width: 105),
            Expanded(
              child: SizedBox(
                height: 370,
                width: MediaQuery.sizeOf(context).width,
                child: Stack(
                  alignment: Alignment.topCenter,
                  clipBehavior: Clip.hardEdge,
                  children: [
                    if (connectivity != MatConnectionType.none)
                      Positioned(
                        top: 0,
                        right: 15,
                        child: Image.asset(
                          width: 30,
                          'assets/images/battery_status.png',
                          height: 30,
                        ),
                      ),
                    CustomPaint(
                      size: Size(255, 300),
                      painter: SemiCircle(
                        startAngle: -pi / 1.65,
                        sweepAngle: pi + .4,
                      ),
                    ),
                    // big botton in middle
                    Positioned(top: 80, left: 35, child: ConnectivityButton()),
                    Positioned(
                      top: 5,
                      left: 75,
                      child: IconButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            AppTheme.lightTheme.primaryColor,
                          ),
                        ),
                        onPressed: () async {
                          Navigator.pushNamed(context, '/yoga_session');
                        },
                        color: Colors.white,
                        padding: EdgeInsets.all(1),
                        iconSize: 50,
                        icon: Icon(Icons.play_arrow_rounded),
                      ),
                    ),
                    //
                    Positioned(
                      right: -0,
                      top: 75,
                      child: IconButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            AppTheme.lightTheme.primaryColor,
                          ),
                        ),
                        onPressed: () async {
                          Navigator.pushNamed(
                            context,
                            RouteNames.productsScreen,
                          );
                        },
                        color: Colors.white,
                        padding: EdgeInsets.all(10),
                        iconSize: 33,
                        alignment: Alignment.center,
                        icon: Icon(Icons.shopping_cart),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      bottom: 85,
                      child: IconButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            AppTheme.lightTheme.primaryColor,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, RouteNames.features);
                        },
                        color: Colors.white,
                        padding: EdgeInsets.all(10),
                        iconSize: 33,
                        icon: Icon(Icons.fiber_new_outlined),
                      ),
                    ),
                    Positioned(
                      bottom: 45,
                      left: 75,

                      child: IconButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            AppTheme.lightTheme.primaryColor,
                          ),
                        ),
                        onPressed: () {
                          ref
                              .read(drawerStateProvider.notifier)
                              .state
                              .currentState!
                              .openEndDrawer();
                        },
                        color: Colors.white,
                        padding: EdgeInsets.all(10),
                        iconSize: 33,

                        icon: Icon(Icons.home_rounded),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
