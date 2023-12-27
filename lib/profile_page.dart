import 'package:flutter/material.dart';
import 'bottom_navigation_bar.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildProfileHeader(),


            _buildBio(),
            SizedBox(height: 11.0),
            _buildProfileActions(),
            SizedBox(height: 16.0),
            _buildHighlights(),
            SizedBox(height: 16.0),
            _buildBottomBar(),
            _buildPostGrid(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 4,
        onTap: (index) {
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


  Widget _buildProfileHeader() {
    return Padding(
      padding: EdgeInsets.all(11.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 40.0,
                backgroundImage: NetworkImage('https://source.unsplash.com/200x200/?portrait'),
              ),
              SizedBox(width: 39.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildStatItem('Posts', '100', Icons.image),
                  _buildStatItem('Followers', '500', Icons.people),
                  _buildStatItem('Following', '200', Icons.person),
                ],
              ),
            ],
          ),
          SizedBox(height: 9.0),
          Text(
            'Username',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Icon(icon, size: 24.0),
              SizedBox(width: 8.0),
              Text(
                value,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue
                ),
              ),
            ],
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }



  Widget _buildBio() {
    return Padding(
      padding: EdgeInsets.all(13.0),
      child: Text(
        'Turning ideas into apps with passion and precision. '
            '🛠️ Lets code the future together! 💻✨ '
            '#AppDeveloper #TechInnovator',
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
    );
  }
  Widget _buildProfileActions() {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 16.0),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      ElevatedButton.icon(
    onPressed: () {

    } ,
    icon: Icon(Icons.edit),
    label: Text('Edit profile'),
    ),
      ElevatedButton.icon(
        onPressed: () {

        } ,
        icon: Icon(Icons.share),
        label: Text('Share profile'),
      ),
      ElevatedButton(
        onPressed: () {
          // Your onPressed logic here
        },
        child: Icon(Icons.person_add),
      ),

    ],
    ),
    );

  }
  Widget _buildHighlights() {
    // Replace this with your implementation of highlights section
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildHighlightItem('Highlight 1', Icons.add),
          _buildHighlightItem('Highlight 2', Icons.location_city),
          _buildHighlightItem('Highlight 3', Icons.theaters),
          _buildHighlightItem('Highlight 1', Icons.add),
          _buildHighlightItem('Highlight 1', Icons.add),
          _buildHighlightItem('Highlight 1', Icons.add),
          _buildHighlightItem('Highlight 1', Icons.add),
          _buildHighlightItem('Highlight 1', Icons.add),
          _buildHighlightItem('Highlight 1', Icons.add),



        ],
      ),
    );
  }

  Widget _buildHighlightItem(String label, IconData icon) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundColor: Colors.grey,
            child: Icon(
              icon,
              size: 30.0,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 4.0),
          Text(
            label,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(Icons.grid_on, size: 30.0),
        Icon(Icons.movie, size: 30.0),
        Icon(Icons.book, size: 30.0),
        Icon(Icons.person, size: 30.0),
      ],
    );
  }
  Widget _buildPostGrid() {
    // Replace the Image paths with your actual image paths
    List<String> postImagePaths = [
      'https://source.unsplash.com/200x200/?portrait',
      'https://source.unsplash.com/200x200/?portrait',
      'https://source.unsplash.com/200x200/?portrait',
      // Add more post image URLs as needed
    ];

    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2.0,
        mainAxisSpacing: 2.0,
      ),
      itemCount: postImagePaths.length,
      itemBuilder: (BuildContext context, int index) {
        return Image.network(
          postImagePaths[index],
          fit: BoxFit.cover,
        );
      },
    );
  }

}