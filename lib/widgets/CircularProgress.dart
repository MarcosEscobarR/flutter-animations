import 'dart:math';

import 'package:flutter/material.dart';

class CircularProgress extends StatefulWidget {
  @required
  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double barSize;

  const CircularProgress(
      {this.porcentaje,
      this.colorPrimario = Colors.blue,
      this.colorSecundario = Colors.grey,
      this.barSize = 4});

  @override
  _CircularProgressState createState() => _CircularProgressState();
}

class _CircularProgressState extends State<CircularProgress>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  double porcentajeAnterior;

  @override
  void initState() {
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 200));

    porcentajeAnterior = widget.porcentaje;

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);

    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MyCircularProgress(
                (widget.porcentaje - diferenciaAnimar) +
                    (controller.value * diferenciaAnimar),
                widget.colorPrimario,
                widget.colorSecundario,
                widget.barSize),
          ),
        );
      },
    );
  }
}

class _MyCircularProgress extends CustomPainter {
  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final barSize;

  _MyCircularProgress(
      this.porcentaje, this.colorPrimario, this.colorSecundario, this.barSize);
  @override
  void paint(Canvas canvas, Size size) {
    //circulo
    final paint = new Paint()
      ..color = colorSecundario
      ..strokeWidth = barSize
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, paint);

    //Arco
    final paintArco = new Paint()
      ..color = colorPrimario
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final arcAngle = 2 * pi * (porcentaje / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, paintArco);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
