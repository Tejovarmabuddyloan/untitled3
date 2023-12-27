// add_page.dart

import 'package:flutter/material.dart';
import 'bottom_navigation_bar.dart';

class AddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Page'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text('Add Page Content'),
            ),
          ),
          _buildUploadSection(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 2,
        onTap: (index) {
          // Handle navigation to other pages here based on index
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/');
              break;
            case 1:
              Navigator.pushNamed(context, '/search');
              break;
            case 2:
              Navigator.pushNamed(context, '/add');
              break;
            case 3:
              Navigator.pushNamed(context, '/notifications');
              break;
            case 4:
              Navigator.pushNamed(context, '/profile');
              break;
          }
        },
      ),
    );
  }

  Widget _buildUploadSection() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Image.network(
            "https://igimages.gumlet.io/hindi/gallery/movies/raabta/raaabta_poster.jpg?w=240&dpr=1.0",

            width: double.infinity,
            height: 200.0,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 16.0),
          Text('Upload a Photo'),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // Implement photo upload logic here
            },
            child: Text('Upload'),
          ),
        ],
      ),
    );
  }
}
