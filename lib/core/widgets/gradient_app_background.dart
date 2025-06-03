import 'package:flutter/material.dart';
import 'package:yoga_verse/core/themes/app_colors.dart';

class GradientAppBackground extends StatelessWidget {
  const GradientAppBackground({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: AppColors.lightLinearBackground),
      child: child,
    );
  }
}
