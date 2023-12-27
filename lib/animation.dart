import 'package:flutter/material.dart';

class AnimatedContainerApp extends StatefulWidget {
  const AnimatedContainerApp({Key? key}) : super(key: key);

  @override
  _AnimatedContainerAppState createState() => _AnimatedContainerAppState();
}

class _AnimatedContainerAppState extends State<AnimatedContainerApp> {
  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);
  double _fontSize = 20.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Animations'),
        ),
        body: Column(
          children: [
            Center(
              child: AnimatedContainer(
                width: _width,
                height: _height,
                decoration: BoxDecoration(
                  color: _color,
                  borderRadius: _borderRadius,
                ),
                duration: const Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
              ),
            ),
            SizedBox(height: 20),
            Text("hiii", style: TextStyle(fontSize: _fontSize)),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {



              // Start the animation
              _width = 300.toDouble();
              _height = 300.toDouble();
              _color = Color.fromRGBO(
                256,
                256,
                256,
                1,
              );
              _borderRadius = BorderRadius.circular(100.toDouble());
              _fontSize = 60.0.toDouble();
            });
          },
          child: const Icon(Icons.animation),
        ),
      ),
    );
  }
}