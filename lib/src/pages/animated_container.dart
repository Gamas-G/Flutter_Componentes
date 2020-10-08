import 'package:flutter/material.dart';

import 'dart:math';

class AnimatedContainerPage extends StatefulWidget {
  AnimatedContainerPage({Key key}) : super(key: key);

  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  
  double _widht = 50.0;
  double _height = 50.0;
  Color _color = Colors.pink;


  BorderRadiusGeometry _bordeRadius = BorderRadius.circular(0.8);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container')
        ),

        body: Center(
          child: AnimatedContainer(
            curve: Curves.fastOutSlowIn,
            duration: Duration( seconds: 1 ),
            width: _widht,
            height: _height,
            decoration: BoxDecoration(
              borderRadius: _bordeRadius,
              color: _color
              ),
          ),
        ),

        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: _cambiarForma
          ),
    );
  }

  void _cambiarForma() {

    final random = Random();

    setState(() {
      _widht  = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();
      _color = Color.fromRGBO(
        random.nextInt(255),
        random.nextInt(255),
        random.nextInt(255),
        1);
        _bordeRadius = BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }
}