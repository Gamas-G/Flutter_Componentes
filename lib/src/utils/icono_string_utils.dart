import 'package:flutter/material.dart';


//Pagina para obtener iconos de un string

//Cramos un Map con los tipo de datos String y IconData(un icono no un widget Icon)
final _icons = <String, IconData>{

  'add_alert'     : Icons.add_alert,
  'accessibility' : Icons.accessibility,
  'folder_open'   : Icons.folder_open,
  'donut_large'   : Icons.donut_large,
  'input'         : Icons.input,
  'tune'         : Icons.tune,
  'list'         : Icons.list

};

//Metedo con el cual accederemos al Map y retornamos un widget con el iconData que esta almacenado en nuestro Map
Icon getIcon(String nombreIcono){

  return Icon(_icons[nombreIcono], color: Colors.blue);

}