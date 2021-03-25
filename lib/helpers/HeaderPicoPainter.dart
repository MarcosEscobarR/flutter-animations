import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderPicoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();
    paint.color = Colors.blueAccent;
    paint.style = PaintingStyle.fill;

    final path = new Path();
    path.lineTo(0, size.height * 0.30);
    path.lineTo(size.width * 0.5, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
