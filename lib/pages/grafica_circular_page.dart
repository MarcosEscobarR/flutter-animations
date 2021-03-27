import 'package:disenhos/widgets/CircularProgress.dart';
import 'package:flutter/material.dart';

class GraficaCircularPage extends StatefulWidget {
  @override
  _GraficaCircularPageState createState() => _GraficaCircularPageState();
}

class _GraficaCircularPageState extends State<GraficaCircularPage> {
  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              porcentaje += 10;
              if (porcentaje > 100) {
                porcentaje = 0;
              }
            });
          },
          child: Icon(Icons.refresh),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RadialProgress(porcentaje: porcentaje, color: Colors.amber),
                RadialProgress(porcentaje: porcentaje, color: Colors.red)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RadialProgress(porcentaje: porcentaje, color: Colors.blue),
                RadialProgress(porcentaje: porcentaje, color: Colors.yellow)
              ],
            )
          ],
        ));
  }
}

class RadialProgress extends StatelessWidget {
  const RadialProgress({
    @required this.porcentaje,
    this.color,
  });

  final double porcentaje;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 180,
        width: 180,
        child: CircularProgress(
          porcentaje: porcentaje,
          colorPrimario: color,
          colorSecundario: Colors.grey,
          barSize: 0,
        ),
      ),
    );
  }
}
