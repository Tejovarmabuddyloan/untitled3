
import 'package:flutter/material.dart';
import 'bottom_navigation_bar.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications Page'),
      ),
      body: _buildNotificationList(),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 3,
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

  Widget _buildNotificationList() {
    // Sample data for different profiles
    List<Map<String, String?>> notifications = [
      {
        'profileImage':     "https://igimages.gumlet.io/hindi/gallery/movies/raabta/raaabta_poster.jpg?w=240&dpr=1.0",


        'username': 'user1',
        'notificationTitle': 'Liked your post',
        'notificationMessage': 'Check it out!',
      },
      {
        'profileImage':     "https://igimages.gumlet.io/hindi/gallery/movies/raabta/raaabta_poster.jpg?w=240&dpr=1.0",


        'username': 'user2',
        'notificationTitle': 'Followed you',
        'notificationMessage': 'Follow back!',
      },
      {
        'profileImage':    "https://igimages.gumlet.io/hindi/gallery/movies/raabta/raaabta_poster.jpg?w=240&dpr=1.0",


        'username': 'user3',
        'notificationTitle': 'Followed you',
        'notificationMessage': 'Follow back!',
      },
      {
        'profileImage':     "https://igimages.gumlet.io/hindi/gallery/movies/raabta/raaabta_poster.jpg?w=240&dpr=1.0",


        'username': 'user4',
        'notificationTitle': 'Followed you',
        'notificationMessage': 'Follow back!',
      },
      {
        'profileImage':     "https://igimages.gumlet.io/hindi/gallery/movies/raabta/raaabta_poster.jpg?w=240&dpr=1.0",


        'username': 'user5',
        'notificationTitle': 'Followed you',
        'notificationMessage': 'Follow back!',
      },
      {
        'profileImage':     "https://igimages.gumlet.io/hindi/gallery/movies/raabta/raaabta_poster.jpg?w=240&dpr=1.0",


        'username': 'user6',
        'notificationTitle': 'Followed you',
        'notificationMessage': 'Follow back!',
      },
      {
        'profileImage':    "https://igimages.gumlet.io/hindi/gallery/movies/raabta/raaabta_poster.jpg?w=240&dpr=1.0",


        'username': 'user7',
        'notificationTitle': 'Followed you',
        'notificationMessage': 'Follow back!',
      },
      {
        'profileImage':     "https://igimages.gumlet.io/hindi/gallery/movies/raabta/raaabta_poster.jpg?w=240&dpr=1.0",


        'username': 'user8',
        'notificationTitle': 'Followed you',
        'notificationMessage': 'Follow back!',
      },
      {
        'profileImage':   "https://igimages.gumlet.io/hindi/gallery/movies/raabta/raaabta_poster.jpg?w=240&dpr=1.0",



        'username': 'user9',
        'notificationTitle': 'Followed you',
        'notificationMessage': 'Follow back!',
      },
    ];

    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(notifications[index]['profileImage'] ?? ''),
          ),
          title: Text(notifications[index]['username'] ?? ''),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(notifications[index]['notificationTitle'] ?? ''),
              Text(notifications[index]['notificationMessage'] ?? ''),
            ],
          ),
          onTap: () {
          },
        );
      },
    );
  }
}