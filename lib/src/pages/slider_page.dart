import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class SliderPapge extends StatefulWidget {

  @override
  _SliderPapgeState createState() => _SliderPapgeState();
}

class _SliderPapgeState extends State<SliderPapge> {

  double _valorSlider = 420.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Page'),
      ),

      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            _crearSlider(),
            _crearCheckBox(),
            _crearSwitch(),
            Expanded(
              child: _crearImagen()
              )
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      min: 0.0,
      max: 420.0,
      value: _valorSlider,
      label: 'Tamaño de la Imagem',
      activeColor: Colors.indigoAccent,
      onChanged: (_bloquearCheck) ? null : (valor){
        
        setState(() =>_valorSlider = valor );
        
      }
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage('https://s1.1zoom.me/big0/602/Transformers_The_Last_Knight_Optimus_Prime_Robot_525930_725x1024.jpg'),
      width: _valorSlider,
      fit: BoxFit.cover,
    );
  }

  Widget _crearCheckBox() {
    return CheckboxListTile(
      title: Text('Bloquear Slider con checkBox'),
      value: _bloquearCheck,
      onChanged: (valor){
        setState(() {
          _bloquearCheck = valor;
        });
      }
      );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text('Bloquear Slider con Switch'),
      value: _bloquearCheck,
      onChanged: (valor){
        setState(() {
          _bloquearCheck = valor;
        });
      }
      );
  }
}