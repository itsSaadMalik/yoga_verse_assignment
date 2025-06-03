import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yoga_verse/core/themes/app_theme.dart';

class SemiCircle extends CustomPainter {
  final double startAngle;
  final double sweepAngle;

  SemiCircle({
    super.repaint,
    required this.startAngle,
    required this.sweepAngle,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.black
          ..strokeWidth = 1
          ..style = PaintingStyle.stroke;
    canvas.drawArc(
      Rect.fromLTRB(-0, 30, size.width, size.height),
      startAngle,
      sweepAngle, //uptill where u want to draw the arc
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
