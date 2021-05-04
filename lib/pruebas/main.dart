import 'package:disenhos/pruebas/pages/header_page.dart';
import 'package:flutter/material.dart';

class PruebaMain extends StatefulWidget {
  @override
  _PruebaMainState createState() => _PruebaMainState();
}

class _PruebaMainState extends State<PruebaMain> {
  double porcentaje = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            porcentaje += 10;
            if (porcentaje >= 100) {
              porcentaje = 0;
            }
          });
        },
        child: Icon(Icons.update),
      ),
      body: HeaderPage(),
    );
  }
}
