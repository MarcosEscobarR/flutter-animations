// import 'package:disenhos/challengs/CuadradoAnimadoPage.dart';
// import 'package:disenhos/pages/animated_page.dart';
// import 'package:disenhos/labs/circular_progress_page.dart';
// import 'package:disenhos/pages/grafica_circular_page.dart';
// import 'package:disenhos/pages/header_page.dart';
import 'package:disenhos/labs/slider_page.dart';
import 'package:disenhos/pages/emergency_page.dart';
import 'package:disenhos/pages/luancher_page.dart';
import 'package:disenhos/pages/pinterest_page.dart';
import 'package:disenhos/pages/slider-page.dart';
import 'package:disenhos/pages/sliver_list_page.dart';
import 'package:disenhos/pruebas/main.dart';
import 'package:disenhos/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'package:disenhos/pages/slider-page.dart';

void main() =>
    runApp(ChangeNotifierProvider(
        create: (_) => new ThemeChanger(),
        child: MyApp()
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeChanger>(context).currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Disenhos',
      home: LauncherPage(),
    );
  }
}
