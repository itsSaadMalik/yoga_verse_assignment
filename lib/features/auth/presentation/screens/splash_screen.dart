import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/core/widgets/gradient_app_background.dart';
import 'package:yoga_verse/features/auth/presentation/provider/login_state_provider.dart';
import 'package:yoga_verse/features/auth/presentation/provider/user_provider.dart';
import 'package:yoga_verse/features/auth/presentation/screens/login_view.dart';
import 'package:yoga_verse/features/home/presentation/screens/home_page.dart';
import 'package:yoga_verse/main.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    final loginState = ref.read(loginStateProvider);
    return GradientAppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: loginState.when(
          data: (data) => data ? HomePage() : LoginView(),
          error: (error, stackTrace) => LoginView(),
          loading: () => Center(child: Text('loading')),
        ),
      ),
    );
  }
}
