// // main.dart
//
// import 'package:flutter/material.dart';
// import 'bottom_navigation_bar.dart';
// import 'search_page.dart';
// import 'add_page.dart';
// import 'notifications_page.dart';
// import 'messages_page.dart';
// import 'profile_page.dart';
// // import 'movies.dart';
// void main() {
//   runApp(MyApp());
// }
//
//
// List<String> storyImages = [
//   "https://igimages.gumlet.io/hindi/gallery/movies/raabta/raaabta_poster.jpg?w=240&dpr=1.0",
//   "https://igimages.gumlet.io/hindi/gallery/movies/raabta/raaabta_poster.jpg?w=240&dpr=1.0",
//   "https://igimages.gumlet.io/hindi/gallery/movies/raabta/raaabta_poster.jpg?w=240&dpr=1.0",
//   "https://igimages.gumlet.io/hindi/gallery/movies/raabta/raaabta_poster.jpg?w=240&dpr=1.0",
//   "https://igimages.gumlet.io/hindi/gallery/movies/raabta/raaabta_poster.jpg?w=240&dpr=1.0",
//   "https://igimages.gumlet.io/hindi/gallery/movies/raabta/raaabta_poster.jpg?w=240&dpr=1.0",
//   "https://igimages.gumlet.io/hindi/gallery/movies/raabta/raaabta_poster.jpg?w=240&dpr=1.0",
//   "https://igimages.gumlet.io/hindi/gallery/movies/raabta/raaabta_poster.jpg?w=240&dpr=1.0",
//   "https://igimages.gumlet.io/hindi/gallery/movies/raabta/raaabta_poster.jpg?w=240&dpr=1.0",
//
//
//
//   // Add more URLs as needed
// ];
//
// List<String> feedIcons = [
//   "https://igimages.gumlet.io/hindi/gallery/movies/raabta/raaabta_poster.jpg?w=240&dpr=1.0",
//   "https://igimages.gumlet.io/hindi/gallery/movies/raabta/raaabta_poster.jpg?w=240&dpr=1.0",
//   "https://igimages.gumlet.io/hindi/gallery/movies/raabta/raaabta_poster.jpg?w=240&dpr=1.0",
//   "https://igimages.gumlet.io/hindi/gallery/movies/raabta/raaabta_poster.jpg?w=240&dpr=1.0",
//   "https://igimages.gumlet.io/hindi/gallery/movies/raabta/raaabta_poster.jpg?w=240&dpr=1.0",
//   "https://igimages.gumlet.io/hindi/gallery/movies/raabta/raaabta_poster.jpg?w=240&dpr=1.0",
//   "https://igimages.gumlet.io/hindi/gallery/movies/raabta/raaabta_poster.jpg?w=240&dpr=1.0",
//   "https://igimages.gumlet.io/hindi/gallery/movies/raabta/raaabta_poster.jpg?w=240&dpr=1.0",
//   "https://igimages.gumlet.io/hindi/gallery/movies/raabta/raaabta_poster.jpg?w=240&dpr=1.0",
//   // Add more URLs as needed
// ];
//
// List<String> profileIcons = [
//   "https://igimages.gumlet.io/hindi/gallery/movies/raabta/raaabta_poster.jpg?w=240&dpr=1.0",
//   "https://igimages.gumlet.io/hindi/gallery/movies/raabta/raaabta_poster.jpg?w=240&dpr=1.0",
//   "https://igimages.gumlet.io/hindi/gallery/movies/raabta/raaabta_poster.jpg?w=240&dpr=1.0",
//   "https://igimages.gumlet.io/hindi/gallery/movies/raabta/raaabta_poster.jpg?w=240&dpr=1.0",
//   "https://igimages.gumlet.io/hindi/gallery/movies/raabta/raaabta_poster.jpg?w=240&dpr=1.0",
//   "https://igimages.gumlet.io/hindi/gallery/movies/raabta/raaabta_poster.jpg?w=240&dpr=1.0",
//   "https://igimages.gumlet.io/hindi/gallery/movies/raabta/raaabta_poster.jpg?w=240&dpr=1.0",
//   "https://igimages.gumlet.io/hindi/gallery/movies/raabta/raaabta_poster.jpg?w=240&dpr=1.0",
//   "https://igimages.gumlet.io/hindi/gallery/movies/raabta/raaabta_poster.jpg?w=240&dpr=1.0",
//   // Add more URLs as needed
// ];
//
//
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       initialRoute: '/',
//       routes: {
//         '/': (context) => InstagramHomePage(),
//         '/search': (context) => SearchPage(),
//         '/add': (context) => AddPage(),
//         '/notifications': (context) => NotificationsPage(),
//         '/messages': (context) => MessagesPage(),
//         '/profile': (context) => ProfilePage(),
//       },
//       theme: ThemeData(
//         appBarTheme: AppBarTheme(
//           backgroundColor: Colors.white,
//           foregroundColor: Colors.black,
//           iconTheme: IconThemeData(color: Colors.black),
//         ),
//       ),
//     );
//   }
// }
//
// class InstagramHomePage extends StatefulWidget {
//   @override
//   _InstagramHomePageState createState() => _InstagramHomePageState();
// }
//
// class _InstagramHomePageState extends State<InstagramHomePage> {
//   int _currentIndex = 0;
//   List<bool> viewedStories = List.generate(
//       storyImages.length, (index) => false);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Instagram'),
//         automaticallyImplyLeading: false,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.message),
//             onPressed: () {
//               Navigator.pushNamed(context, '/messages');
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Container(
//             height: 100.0,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: storyImages.length,
//               itemBuilder: (context, index) {
//                 return buildStoryAvatar(index);
//               },
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: feedIcons.length,
//               itemBuilder: (context, index) {
//                 return Container(
//                   margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           CircleAvatar(
//                             radius: 20.0,
//                             backgroundColor: Colors.blue,
//                             backgroundImage: NetworkImage(
//                                 profileIcons[index % profileIcons.length]),
//                           ),
//                           SizedBox(width: 8.0),
//                           Text(
//                             'Username',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Container(
//                         margin: EdgeInsets.symmetric(vertical: 8.0),
//                         height: 200.0,
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image: NetworkImage(feedIcons[index]),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           IconButton(
//                             icon: Icon(Icons.favorite_border),
//                             onPressed: () {
//                               // Handle like button press
//                             },
//                           ),
//                           IconButton(
//                             icon: Icon(Icons.mode_comment_outlined),
//                             onPressed: () {
//                               // Handle comment button press
//                             },
//                           ),
//                           IconButton(
//                             icon: Icon(Icons.send),
//                             onPressed: () {
//                               // Handle add button press
//                             },
//                           ),
//                         ],
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(vertical: 4.0),
//                         child: Text(
//                           'Liked by 10 people',
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                       Text(
//                         'Comments',
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: CustomBottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//             // Handle navigation to other pages here based on index
//             switch (index) {
//               case 0:
//                 Navigator.pushNamed(context, '/');
//                 break;
//               case 1:
//                 Navigator.pushNamed(context, '/search');
//                 break;
//               case 2:
//                 Navigator.pushNamed(context, '/add');
//                 break;
//               case 3:
//                 Navigator.pushNamed(context, '/notifications');
//                 break;
//               case 4:
//                 Navigator.pushNamed(context, '/profile');
//                 break;
//             }
//           });
//         },
//       ),
//     );
//   }
//
//   Widget buildStoryAvatar(int index) {
//     return GestureDetector(
//       onTap: () {
//         // Handle story click
//         setState(() {
//           viewedStories[index] = true;
//         });
//       },
//       child: Container(
//         margin: EdgeInsets.all(8.0),
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           gradient: !viewedStories[index]
//               ? LinearGradient(
//             begin: Alignment.centerLeft,
//             end: Alignment.centerRight,
//             colors: [
//               Colors.purple.shade900,
//               Colors.purple.shade100,
//             ],
//           )
//               : null,
//           border: !viewedStories[index]
//               ? Border.all(
//             color: Colors.purple.shade900,
//             width: 2.0,
//           )
//               : null,
//         ),
//         child: CircleAvatar(
//           radius: 30.0,
//           backgroundColor: Colors.purple.shade900,
//           // Set the background color to match the border color
//           backgroundImage: NetworkImage(storyImages[index]),
//         ),
//       ),
//     );
//   }
// }
//
//
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Learning',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() {
//     return _MyHomePageState();
//   }
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   late SharedPreferences prefs;
//   TextEditingController controller = TextEditingController();
//   List<String> names = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Flutter SharedPreferences"),
//       ),
//       body: Container(
//         margin: EdgeInsets.all(20),
//         child: Column(
//           children: [
//             TextField(
//               controller: controller,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             Text(names.join(', '), style: TextStyle(fontSize: 20),),
//             SizedBox(
//               height: 30,
//             ),
//             ElevatedButton(
//
//               child: Text("Save"),
//
//               onPressed: () {
//                 save();
//               },
//             ),
//             ElevatedButton(
//               child: Text("Retrieve"),
//               onPressed: () {
//                 retrieve();
//               },
//             ),
//             ElevatedButton(
//               child: Text("Delete"),
//               onPressed: () {
//                 delete();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   save() async {
//     prefs = await SharedPreferences.getInstance();
//     names.add(controller.text.toString());
//     prefs.setStringList("usernames", "");
//     controller.clear();
//   }
//
//   retrieve() async {
//     prefs = await SharedPreferences.getInstance();
//     names = prefs.getStringList("usernames") ?? [];
//     setState(() {});
//   }
//
//   delete() async {
//     prefs = await SharedPreferences.getInstance();
//
//     // Remove the last element from the list
//     if (names.isNotEmpty) {
//       names.removeLast();
//       prefs.setStringList("usernames", names);
//     }
//
//     setState(() {});
//   }
//
// }
