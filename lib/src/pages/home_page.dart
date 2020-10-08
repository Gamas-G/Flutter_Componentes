import 'package:flutter/material.dart';

import 'package:componentes/src/providers/menu_provider.dart';

import 'package:componentes/src/utils/icono_string_utils.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),

      body: _lista()
    );
  }
  
  Widget _lista(){
    return FutureBuilder(//Un FutureBuilde es un Widget que se contruye asi mismo. Como un Task o thread la aplicaicon se muestra con flujo mientras el widget se contruye asi mismo tomandose le tiempo que necesite

      future: menuProvider.cargarData(),//esta propiedad alamecena los datos ej.Una peticion en internet que consume tiempo esto esperara(osea un Future)

      //Este initial es tomado por el snapshot mientras el future se completa, esto generaba un error en el foreach 'el arreglo estava null'
      initialData: [],//Su funcion es tener informacion por defecto mientras que la propiedad future se completa y si genera un erro el future retornara un null y el FutureBuilder tomara estos valores, esto es opcional
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){//Aqui es donde se construye a si mismo una vez que la propiedad future esta lista pero mientras tanto toma el initial

        return ListView(  //Este es el widget que construimos un ListView
          children: _listaItems(snapshot.data, context)
          );
      }
      );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {

    final _color = Colors.blue;
    
    final List<Widget> opciones = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        leading : getIcon(opt['icon']),//Obtenemos los iconos de una clase(NOTA: Ya existe un paquete de flutter que ayuda con este problema)
        title   : Text(opt['texto']),
        trailing: Icon(Icons.arrow_forward_ios, color: _color),
        onTap: (){

          Navigator.pushNamed(context, opt['ruta']);
        },
      );
      opciones..add(widgetTemp)
              ..add(Divider());
    });

    return opciones;
  
  }

}
