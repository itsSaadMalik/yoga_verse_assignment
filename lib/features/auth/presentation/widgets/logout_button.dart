import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/core/route_names.dart';
import 'package:yoga_verse/features/auth/presentation/provider/logout_usecase_provider.dart';

class LogoutButton extends ConsumerWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        ref.read(logoutUsecaseProvider).logoutUser();
        Navigator.pushReplacementNamed(context, RouteNames.login);
      },
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(CircleBorder()),
        padding: WidgetStatePropertyAll(EdgeInsets.all(17)),
      ),
      child: Icon(
        Icons.logout_rounded,
        color: const Color.fromARGB(255, 3, 3, 3),
        size: 25,
      ),
    );
  }
}
