import 'package:flutter/material.dart';

import 'package:componentes/src/pages/home_page.dart';
import 'package:componentes/src/pages/card_page.dart';
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/avatar_pager.dart';
import 'package:componentes/src/pages/animated_container.dart'; 
import 'package:componentes/src/pages/input_page.dart';
import 'package:componentes/src/pages/slider_page.dart';
import 'package:componentes/src/pages/listview_pase.dart';




/*Este metodo retorna un mapa de rutas para la propiedad routes. Aquí tenemos todos nuestros widgets para poder utilizarlos como rutas con nombres para
el Navigator*/
Map<String, WidgetBuilder> getApplicationRoutes(){
  
  return <String, WidgetBuilder>{
    '/'      : ( BuildContext context ) => HomePage(),
    'alert'  : ( BuildContext context ) => AlertPage(),
    'avatar' : ( BuildContext context ) => AvatarPage(),
    'card'   : ( BuildContext context ) => CardPage(),
    'animatedContainer'   : (BuildContext context) => AnimatedContainerPage(),
    'inputs' : ( BuildContext context ) => InputPage(),
    'slider' : ( BuildContext context ) => SliderPapge(),
    'list'   : ( BuildContext context ) => ListaPage()
  };

}