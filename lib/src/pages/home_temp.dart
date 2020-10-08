import 'package:flutter/material.dart';


//WIDGET DE PRUEBA

class HomePageTemp extends StatelessWidget {

  final options = ['Create', 'Read', 'Update', 'Delete'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Componentes Temp"),
        ),

        body: ListView(
          children: _crearItemsCorto()
        )
      );
  }

  List<Widget> _crearItems(){

    List<Widget> lista = new List<Widget>();

    for (var opt in options) {
      final widgetTemp = ListTile(
        title: Text(opt),
      );
      lista..add(widgetTemp)
           ..add(Divider());
    }

    return lista;
  }

  List<Widget> _crearItemsCorto(){
    int cont = 1;

    return options.map((item) {

      return Column(
        children: [
          ListTile(
            leading: Icon(Icons.accessibility_new),
            title: Text(item),
            subtitle: Text("${cont++}"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider()
        ],
      );

    }).toList();

  }

}