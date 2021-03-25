import 'package:disenhos/pages/animated_page.dart';
// import 'package:disenhos/pages/header_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Disenhos',
      home: AnimatedPage(),
    );
  }
}
