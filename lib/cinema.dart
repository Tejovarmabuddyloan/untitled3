// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'modal.dart';
//
// class MoviePage extends StatefulWidget {
//   @override
//   _MoviePageState createState() => _MoviePageState();
// }
//
// class _MoviePageState extends State<MoviePage> {
//   Future<List<Post>> postsFuture = getPosts();
//
//   static Future<List<Post>> getPosts() async {
//     var url = Uri.parse("https://jsonplaceholder.typicode.com/albums/1/photos");
//     final response = await http.get(url, headers: {"Content-Type": "application/json"});
//     final List body = json.decode(response.body);
//     return body.map((e) => Post.fromJson(e)).toList();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: FutureBuilder<List<Post>>(
//           future: postsFuture,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const CircularProgressIndicator();
//             } else if (snapshot.hasData) {
//               final posts = snapshot.data!;
//               return buildPosts(posts);
//             } else {
//               return const Text("No data available");
//             }
//           },
//         ),
//       ),
//     );
//   }
//
//   Widget buildPosts(List<Post> posts) {
//     return ListView.builder(
//       itemCount: posts.length,
//       itemBuilder: (context, index) {
//         final post = posts[index];
//         return Container(
//           color: Colors.grey.shade300,
//           margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//           padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
//           height: 100,
//           width: double.maxFinite,
//           child: Row(
//             children: [
//               Expanded(flex: 1, child: Image.network(post.url!)),
//               SizedBox(width: 10),
//               Expanded(flex: 3, child: Text(post.title!)),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'modalapicall.dart';
//
// class MoviePage extends StatefulWidget {
//   @override
//   _MoviePageState createState() => _MoviePageState();
// }
//
// class _MoviePageState extends State<MoviePage> {
//   late Future<Post> postsFuture;
//
//   @override
//   void initState() {
//     super.initState();
//     postsFuture = getPosts();
//   }
//
//   Future<Post> getPosts() async {
//     var url = Uri.parse("https://marauderapi.fr/api/characters?page=2");
//     final response = await http.get(url, headers: {"Content-Type": "application/json"});
//     final Map<String, dynamic> data = json.decode(response.body);
//     return Post.fromJson(data);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: FutureBuilder<Post>(
//           future: postsFuture,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const CircularProgressIndicator();
//             } else if (snapshot.hasData) {
//               final items = snapshot.data!.items ?? [];
//               return buildItems(items);
//             } else {
//               return const Text("No data available");
//             }
//           },
//         ),
//       ),
//     );
//   }
//
//   Widget buildItems(List<Items> items) {
//     return ListView.builder(
//       itemCount: items.length,
//       itemBuilder: (context, index) {
//         final item = items[index];
//         return Container(
//           color: Colors.grey.shade300,
//           margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//           padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
//           height: 100,
//           width: double.maxFinite,
//           child: Row(
//             children: [
//               Expanded(flex: 1, child: Image.network(item.picture ?? '')),
//               SizedBox(width: 10),
//               // Add other widgets or data from the 'item' as needed
//             ],
//           ),
//         );
//       },
//     );
//   }
// }