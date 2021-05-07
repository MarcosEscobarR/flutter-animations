import 'package:disenhos/challengs/CuadradoAnimadoPage.dart';
import 'package:disenhos/labs/slider_page.dart';
import 'package:disenhos/pages/emergency_page.dart';
import 'package:disenhos/pages/grafica_circular_page.dart';
import 'package:disenhos/pages/header_page.dart';
import 'package:disenhos/pages/pinterest_page.dart';
import 'package:disenhos/pages/sliver_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final pageRoutes = <_Route> [
  _Route(FontAwesomeIcons.slideshare, 'SlidesShow', SliderPage()),
  _Route(FontAwesomeIcons.ambulance, 'Emergency', EmergencyPage()),
  _Route(FontAwesomeIcons.heading, 'Encabezados', HeaderPage()),
  _Route(FontAwesomeIcons.peopleCarry, 'Cuadro Animado', CuadradoAnimadoPage()),
  _Route(FontAwesomeIcons.circleNotch, 'Circulo de Progreso', GraficaCircularPage()),
  _Route(FontAwesomeIcons.pinterest, 'Pinterest', PinterestPage()),
  _Route(FontAwesomeIcons.mobile, 'Slivers', SliverListPage()),

];

class _Route {
  final IconData icon;
  final String title;
  final Widget page;

  _Route(this.icon, this.title, this.page);
}