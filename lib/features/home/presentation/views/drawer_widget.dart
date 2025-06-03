import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/core/route_names.dart';
import 'package:yoga_verse/core/themes/app_colors.dart';
import 'package:yoga_verse/features/auth/presentation/provider/user_provider.dart';
import 'package:yoga_verse/features/auth/presentation/widgets/logout_button.dart';

class DrawerWidget extends ConsumerWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userProvider);

    return SafeArea(
      child: SizedBox(
        height: 700,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 20, 0, 20),
          child: Drawer(
            // shadowColor: const Color.fromARGB(255, 170, 170, 170),
            // elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.horizontal(left: Radius.circular(40)),
            ),
            width: 280,
            child: DefaultTextStyle(
              style: Theme.of(context).textTheme.bodySmall ?? TextStyle(),
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 50, 10, 30),
                decoration: BoxDecoration(
                  gradient: AppColors.secondaryLinearBackground,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      spacing: 15,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(2),
                          // clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            color: AppColors.applightThemePrimaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.white,
                            child: Image.asset(
                              'assets/images/lotus.png',
                              height: 100,
                            ),
                          ),
                        ),
                        Expanded(child: Text(userData.value?.name ?? '')),
                      ],
                    ),
                    SizedBox(height: 30),
                    DefaultTextStyle(
                      style:
                          Theme.of(
                            context,
                          ).textTheme.bodySmall?.copyWith(fontSize: 11) ??
                          TextStyle(),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(15, 30, 0, 20),
                        margin: EdgeInsets.fromLTRB(5, 30, 0, 0),
                        // height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: .1),
                          borderRadius: BorderRadius.circular(23),
                        ),
                        child: Column(
                          spacing: 30,
                          children: [
                            Row(
                              spacing: 20,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.fiber_new_outlined, size: 22),
                                Text('Features'),
                              ],
                            ),
                            Row(
                              spacing: 20,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.settings, size: 22),
                                Text('Settings'),
                              ],
                            ),
                            Row(
                              spacing: 20,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.shopping_cart, size: 22),
                                Text('Cart'),
                              ],
                            ),
                            Row(
                              spacing: 20,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.music_note, size: 22),
                                Text('Music'),
                              ],
                            ),
                            InkWell(
                              onTap:
                                  () => Navigator.pushNamed(
                                    context,
                                    RouteNames.about,
                                  ),
                              child: Row(
                                spacing: 20,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.info_outline, size: 22),
                                  Text('About'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: LogoutButton(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
