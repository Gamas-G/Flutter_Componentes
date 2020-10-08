import 'package:flutter/material.dart';


class CardPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cards"),
      ),

      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          SizedBox(height: 20.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 20.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 20.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 20.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 20.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 20.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      elevation: 10.0,
      shadowColor: Colors.blue,
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.account_circle, size: 45.0 , color: Colors.blue),
            title: Text("Bienvenido"),
            subtitle: Text("Compra un boleto\n\nSe el afortunado de ganar un viaje inolvidable"),
          ),
          ButtonBar(
            children: [
              FlatButton(onPressed: (){}, child: Text("Comprar")),
              FlatButton(onPressed: null, child: Text("Saltar")),
            ],
          )
        ],
      )
    );
  }

  Widget _cardTipo2() {
    final card =  Container(
      //clipBehavior: Clip.antiAlias,//Ayuda en mantener todo dentro de la tarjeta evitando el desvorte de las esquinas
      child: Column(
        children: [
          
          FadeInImage(
            placeholder: AssetImage('images/wait.gif'),
            image: NetworkImage('https://www.azureazure.com/wp-content/uploads/2019/09/thailand-beach.jpg'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
            ),

          Container(
            padding: EdgeInsets.all(10.0),
            child: Text("Paisaje")
            )
        ],
      ),

    );

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)
          )
        ],
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: ClipRRect( //Este Widget ayuda a cortar los border que se encuentran fuera de su contenedor padre en este caso el Container
        borderRadius: BorderRadius.circular(20.0),
        child: card,
      ),
    );
  }
}