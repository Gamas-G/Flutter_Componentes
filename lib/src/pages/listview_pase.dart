import 'package:flutter/material.dart';

import 'dart:async';

class ListaPage extends StatefulWidget {

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  //Necesitamos detectar el final de la lista, para asi volver a llamar nuestro metodo 'aggregar10' e incrementar nuestra Lista
  ScrollController _scrollController = new ScrollController();//Objeto que nos ayudara con la carga de nuevos elementos a nuestra Lista

  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  bool _isLoading = false;//Bandera que nos indicara cuando estoy cargando informacion para el metodo 'fechData'


  //Necesitamos llamar la creacion de esos elementos en una de las etapas del ciclo de vida en un Statefulwidget
  @override
  void initState() {
    super.initState();//Este super hace referencia a la clase State(la que esta arriba) y la inicializa
    _agregar10();

    _scrollController.addListener(() { //Estamos añadiendo un metodo de escucha al objeto _scrollController y es llamado cada vez que se utiliza el scroll
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        // _agregar10();
        fechData();//Metedo que recrea una simulacion de una peticion http
      }
    });
  }

  //Cada vez que se entra al Widget de Lista se crear nuevos Listener entonces cada vez que salimos desechamos el controller con su metod Listener con ayuda del Dispose
  @override
  void dispose() {//Cuando la pagina es destruida se dispara este metodo
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Lista Page'),
       ),

       body: Stack(
         children: [
           _crearLista(),
           _crearLoading(),
         ],
       )
    );
  }

  Widget _crearLista(){
    return RefreshIndicator(
      onRefresh: obtenerPagina1,
      child: ListView.builder(//Deacuerdo a la documentacion ListView.Builder es el indicado para crear Listas de View de cantidandes grandes o sea una Lista Infinita
        controller: _scrollController,
        itemCount: _listaNumeros.length, //El número de elementos que tiene esta lista en este momento
        itemBuilder: ( BuildContext context, int index ){//Por que crear un build context?????? itemBuilder se encarga de redibujar los widget o vistas que son requeridos para mostrar en la pantalla del dispositivo

          final imagen = _listaNumeros[index];

          return FadeInImage(
            placeholder: AssetImage('images/wait.gif'),
            image: NetworkImage('https://picsum.photos/500/300/?image=$imagen'),//Picsum es un servicio web
            fadeInDuration: Duration(milliseconds: 200),
            );
        }
        ),
    );
  }

  Future<Null> obtenerPagina1() async{
    final duration = new Duration(seconds: 2);
    new Timer(
      duration,(){
        _listaNumeros.clear();
        _ultimoItem++;
        _agregar10();
      }

      
    );
    return Future.delayed(duration);
  }

  void _agregar10(){ //Este metodo cada vez que se llame agregara 10 imagenes a la lista

  for (var i = 1; i < 10; i++) {
    _ultimoItem++;
    _listaNumeros.add( _ultimoItem );
  }

  setState(() {});

  }

  Future<Null> fechData() async{
    
    _isLoading = true;//Se esta haciendo una peticion
    setState(() {});

    final duration = new Duration( seconds: 2);
    return new Timer(
      duration,
      respuestaHTTP
      );//Timer se importa d ela libreria Dart.Async
    
  }

  void respuestaHTTP(){
    _isLoading = false;

    _scrollController.animateTo(//Aqui movemmos el scroll cuando la peticion http a sido completada. Esto con ayuda del metodo 'animateTo' del controller
      _scrollController.position.pixels + 100,//Aquí obtenemos la posicion que se encuentra el scroll en este caso el metodo da referencia que es el final entonces sumamos 100 pixeles mas para observar la siguiente imagen
      curve: Curves.fastOutSlowIn, //Animacion
      duration: new Duration( milliseconds: 250 )//Su duracion
      );

    _agregar10();
  }

  Widget _crearLoading() {
    if(_isLoading){
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator()
            ],
          ),
          SizedBox(height: 15.0)
        ],
      );
    }else{
      return Container();
    }
  }
}