import 'package:flutter/material.dart';

import 'package:componentes/src/pages/alert_page.dart';

import 'package:componentes/src/routes/routes.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    //NOTA:De acuerdo a la creacion del arbol de widget el context guarda ese historial y este context guarda como dirty(segun la documentacion ese se debe a que este widget se ha marcado como necesario para la reconstruccion)
    print('Este es mi primer context: ${context.toString()}');
    return MaterialApp(
      //MMM guarda los idiomas, para luego utilizarlos con Locale una muestra se encuentra en input_page
      localizationsDelegates: [
         GlobalMaterialLocalizations.delegate,
         GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // Ingles, no country code
        const Locale('es', 'MX'), // Español de México, no country code
      ],

      debugShowCheckedModeBanner: false,
      title: 'Componentes APP',
      /*MaterialApp consta de muchas propiedades y routes sustituye a home ya que nuestra aplicacion cuenta con muchas vistas y el uso del navigation 
      es utilizada para eso es esta propiedas. Navigation.pushNamed toma y utiliza nombres con rutas las cuales estan almacenadas en esta propuedad*/
      routes: getApplicationRoutes(),
      
      initialRoute: '/',//Esta propiedad es necesario cuando no se utiliza home el '/' lo toma por defecto como la primera en mostrar. Es ma scomo un estandar

      onGenerateRoute: ( RouteSettings settings ){ //este parametro toma lugar cuando un widget no existe en routes y si no existe lo redirige a la riguiente ruta
        return MaterialPageRoute( //toma los datos necesarios para construir una ruta
          builder: (context) => AlertPage()
          );
      } ,
    );
  }
}