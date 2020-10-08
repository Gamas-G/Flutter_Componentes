import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {


  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre = '';
  String _email  = '';
  String _fecha  = '';
  String _opcionSeleccionada = 'Volar';

  List <String>_poderes = ['Volar', 'Rayos X', 'Super Aliento', 'Super Fuerza'];

  TextEditingController _inputFieldDatecontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
           title: Text('Input Page'),
         ),

         body: ListView(
           padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
           children: [
             _crearInput(),
             Divider(),
             _crearEmail(),
             Divider(),
             _crearPassword(),
             Divider(),
             _crearFecha( context ),
             Divider(),
             _crearDropdown(),
             Divider(),
             _crearPersona(),
           ],
         ),
       );
  }

  Widget _crearInput() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        icon: Icon(Icons.account_circle, size: 35.0),
        labelText: 'Nombre',
        hintText: 'Nombre de Usuario',
        counter: Text('Letras ${ _nombre.length }'),
        helperText: 'Sòlo el nombre',
        suffixIcon: Icon(Icons.accessibility)
      ),
      onChanged: (value) => setState(() {
        _nombre = value;  
        }),
      textCapitalization: TextCapitalization.sentences,
    );
    
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('Tú email es: $_email'),
      trailing: Text(_opcionSeleccionada ),
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        icon: Icon(Icons.email, size: 35.0),
        labelText: 'Email',
        hintText: 'Tú Email',
        helperText: 'Ejemplo@outlook.coom',
        suffixIcon: Icon(Icons.alternate_email)
      ),
      onChanged: (value) => setState(() {
        _email = value;
        }),
    );
  }

  Widget _crearPassword() {
     return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        icon: Icon(Icons.lock, size: 35.0),
        labelText: 'Password',
        hintText: 'Tú Password',
        suffixIcon: Icon(Icons.lock_open)
      ),
      onChanged: (value) => setState(() {
        
        }),
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      controller: _inputFieldDatecontroller,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        icon: Icon(Icons.perm_contact_calendar, size: 35.0),
        labelText: 'Fehca de Nacimiento',
        hintText: 'Fecha de Nacimiento',
        suffixIcon: Icon(Icons.calendar_today)
      ),
      onTap: (){

        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);

      },
    );
  }

  void _selectDate(BuildContext context) async {

    //DateTime sirve para almacenar una fecha
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2025),
      locale: Locale('es', 'MX')
      );
      

      if( picked != null ){
        setState(() {
          _fecha = picked.toString();
            _inputFieldDatecontroller.text = _fecha;
        });
      }

  }

  Widget _crearDropdown() {
    return Row(
      children: [
        Icon(Icons.select_all, size: 35.0),
        SizedBox(width: 30.0),
        DropdownButton(
          icon: Icon(Icons.arrow_drop_down_circle),
          items: getOpcionesDropdown(),
          value: _opcionSeleccionada,
          onChanged: (option){
            setState(() {
            
            _opcionSeleccionada = option;
              
            });
          }
          ),
      ],
    );
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown(){
    List<DropdownMenuItem<String>> lista = List();
    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
        )
        );
    });
    return lista;
  }
}