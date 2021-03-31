// import 'package:disenhos/challengs/CuadradoAnimadoPage.dart';
// import 'package:disenhos/pages/animated_page.dart';
// import 'package:disenhos/labs/circular_progress_page.dart';
// import 'package:disenhos/pages/grafica_circular_page.dart';
// import 'package:disenhos/pages/header_page.dart';
import 'package:flutter/material.dart';

import 'package:disenhos/pages/slider-page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Disenhos',
      home: SlidersPage(),
    );
  }
}
