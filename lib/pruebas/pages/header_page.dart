import 'package:flutter/material.dart';

class HeaderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CustomPaint(
            painter: _CustomHeader(),
            child: Container(
                padding: EdgeInsets.only(top: 10, left: 65),
                child: Text(
                  'Header de Prueba',
                  style: TextStyle(color: Colors.white, fontSize: 35),
                )),
          ),
        ),
        
      ],
    );
  }
}

class _CustomHeader extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();
    paint.color = Colors.blueAccent;
    paint.style = PaintingStyle.fill;

    final path = new Path();
    path.lineTo(0, size.height * 0.20);
    path.quadraticBezierTo(size.width * 0.10, size.height * 0.30,
        size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.20, size.width, size.height * 0.23);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
