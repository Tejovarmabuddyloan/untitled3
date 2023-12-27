import 'package:flutter/material.dart';
import 'package:whistle_loop_sdk/whistleloop_pixel_fire.dart';
import 'test_2.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NeoPopTiltedButton(
        isFloating: true,
        onTapUp: () {
          // Navigate to quiz description page
          print("Button pressed!");
        },
        colortop: Colors.blue,
        colordge: Colors.lightBlue,
        colorbottom: Colors.blueAccent,
        colortext: Colors.white,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            ElevatedButton(
              child: Text('Fetch All Data'),
              onPressed: () {
                whistle_loop_events("onlcikmybutton");

              },
            ),
          ],
        ),
      ),
    );
  }
}