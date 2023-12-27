import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage({Key? key}) : super(key: key);

  final List<String> imagePaths = [
    'assets/images/buddyloan.png',
    'assets/images/bird.jpeg',
    'assets/images/dog.jpeg',
    'assets/images/elephant.jpeg',
    'assets/images/goat.jpeg',
    'assets/images/lion.jpeg',
    'assets/images/monkey.jpeg',
    'assets/images/pandas.jpeg',
    'assets/images/pig.jpeg',
    'assets/images/zebra.jpeg',
    // Add more image paths here
  ];

  final List<String> imageNames = [
    'giraffe',
    'bird',
    'dog',
    'elephant',
    'goat',
    'lion',
    'monkey',
    'pandas',
    'pig',
    'zebra',
    // Add more names here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image List View'),
      ),
      body: ListView.builder(
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Row(
              children: <Widget>[
                Image.asset(imagePaths[index]),
                SizedBox(width: 16), // Add spacing between the image and text
                Text(imageNames[index]),
              ],
            ),
          );
        },
      ),
    );
  }
}
