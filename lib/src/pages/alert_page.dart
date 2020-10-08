import 'package:flutter/material.dart';


class AlertPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text("AlertPage"),
      ),

      body: Center(
        child: RaisedButton(//Este widget crea un botton('Nota este widget esta obsoleto la documentacion de flutter opta por usar ElevatedButtom')
          onPressed: () => _mostrarAlerta(context),
          child: Text("Mostrar Alerta"),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),//Redoncea las esquinas
          )
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.backspace),
        onPressed: (){

          Navigator.pop(context);
        }
        ),
    );
  }

  void _mostrarAlerta(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: true,//Propiedad si esta en true se puede cerrar el alert dando click fuera del cuadro y si esta en false esta permanecera
      builder: (context){
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text("Soy un titulo"),
          content: Column(
            mainAxisSize: MainAxisSize.min, //Toma el tamaño dependiendo de su contendio el .max se expanda en su maximo
            children: [
              Text("Welcome to Flutter"),
              FlutterLogo(size: 100.0,)
            ],
          ),
          actions: [
            FlatButton(
              onPressed: null,
              child: Text("Aceptar")
              ),
            FlatButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Salir")
              )
          ],
        );
      }
      );
  }

}