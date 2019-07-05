import 'dart:math';

import 'package:flutter/material.dart';
class AnimaedContainerPage extends StatefulWidget {
  _AnimaedContainerPageState createState() => _AnimaedContainerPageState();
}

class _AnimaedContainerPageState extends State<AnimaedContainerPage> {

  double _width = 50.0;
  double _heigth = 50.0;
  Color _color = Colors.purple;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animaciones GG"),
      ),
      body: Center(child: AnimatedContainer(
        curve: Curves.fastOutSlowIn,
        duration: Duration(seconds: 3),
        width: _width,
        height: _heigth,
        decoration: BoxDecoration(
          borderRadius: _borderRadius,
          color: _color
        ),
      ),
      ),
      floatingActionButton: FloatingActionButton(
            child: Icon(Icons.play_arrow),
            onPressed: () {
              final random = Random();
              setState(() {
               _width = random.nextInt(300).toDouble();
              _heigth = random.nextInt(300).toDouble();
              _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
              _color = Color.fromRGBO(
                random.nextInt(255), 
                random.nextInt(255), 
                random.nextInt(255), 
                1); 
              });
            }
      ),
    );
  }
}