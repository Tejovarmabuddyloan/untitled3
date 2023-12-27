import 'dart:async';
import 'package:flutter/material.dart';

class Splashscreen2 extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<Splashscreen2> {
  double _imageSize = 90.0;

  @override
  void initState() {
    super.initState();

    // Delayed animation for image size
    Timer(Duration(seconds: 1), () {
      setState(() {
        _imageSize = 250.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedOpacity(
          duration: Duration(seconds: 3),
          opacity: 1.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _buildImage(),
              _buildHeader(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Text(
        'Welcome to Buddy Loan',
        style: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildImage() {
    return AnimatedContainer(
      duration: Duration(seconds: 3),
      curve: Curves.easeInOut,
      height: _imageSize,
      width: _imageSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage('assets/images/buddyloan.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
