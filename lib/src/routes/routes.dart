import 'package:flutter/material.dart';
import 'package:prueba2/src/pages/alert_page.dart';
import 'package:prueba2/src/pages/avatar_page.dart';
import 'package:prueba2/src/pages/card_page.dart';
import 'package:prueba2/src/pages/home_page.dart';
import 'package:prueba2/src/pages/animated_container.dart';
import 'package:prueba2/src/pages/input_page.dart';
import 'package:prueba2/src/pages/lista_page.dart';
import 'package:prueba2/src/pages/slider_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
    'animatedContainer': (BuildContext context) => AnimaedContainerPage(),
    'inputs': (BuildContext context) => InputPage(),
    'slider': (BuildContext context) => SliderPage(),
    'lista': (BuildContext context) => ListaPage()
  };
}
