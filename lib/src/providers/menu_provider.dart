//Solo necesito un objeto de este paquete y para eso se usa show y el nombre del objeto. rootBundle tiene lo que se mnecesita para leer un JSON
import 'package:flutter/services.dart' show rootBundle;

import 'dart:convert';


class _MenuProvider{
  List<dynamic> opciones = [];

  _MenuProvider(){
    // cargarData();
  }

   Future<List<dynamic>> cargarData() async {
    final resp =  await rootBundle.loadString('data/menu_opts.json');//value es el valor del json, se retorna en un Future
      Map dataMap = json.decode(resp); //Convertimos el string value a un Map para poder utlizar sus parametros en el codigo
      
      opciones = dataMap['rutas'];

      return opciones;
    
  }
}

final menuProvider = new _MenuProvider();//Se crea una sola instancia