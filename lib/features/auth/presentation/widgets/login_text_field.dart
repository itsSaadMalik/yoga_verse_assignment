import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({
    super.key,
    required this.cntrl,
    required this.icon,
    required this.label,
  });
  final TextEditingController cntrl;
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
