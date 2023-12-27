import 'package:flutter/material.dart';
import 'loginpage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'modal.dart';
import 'modalapicall.dart';





class Loginc extends StatelessWidget {
  const Loginc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Design',
      home: MyDesign(),
    );
  }
}

class MyDesign extends StatefulWidget {
  const MyDesign({Key? key}) : super(key: key);

  @override
  _MyDesignState createState() => _MyDesignState();
}

class _MyDesignState extends State<MyDesign> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String errorText = "";
  String? savedUsername; // Declare as an instance variable
  String? savedPassword; // Declare as an instance variable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Design with Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 70),
                Image.asset(
                  'assets/images/buddyloan.png',
                  width: 100,
                  height: 100,
                ),
                SizedBox(height: 50),
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: TextFormField(
                    controller: usernameController,
                    maxLength: 10,
                    onChanged: (value) {
                      if (value.length < 10) {
                        setState(() {
                          errorText = "Fields more than 10";
                        });
                      }
                      else {
                        setState(() {
                          errorText = "";
                        });
                      }
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Username (10-digit)',
                      border: OutlineInputBorder(),
                      errorText: errorText,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Password Text Box
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Login Button
                ElevatedButton(
                  onPressed: () async {
                    String? savedUsername = await CredentialUtils.getSavedUsername();
                    String? savedPassword = await CredentialUtils.getSavedPassword();

                    // Check if the entered credentials match the saved credentials
                    if (usernameController.text == savedUsername &&
                        passwordController.text == savedPassword) {
                      // If they match, navigate to another page and pass the username and password
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MoviePages(
                            username: savedUsername ?? '',
                            password: savedPassword ?? '',
                          ),
                        ),
                      );
                    } else {
                      setState(() {
                        errorText = "Invalid credentials";
                      });
                    }
                  },
                  child: const Text('Login'),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//
// class ResultPage extends StatelessWidget {
//   final String username;
//   final String password;
//
//   ResultPage({required this.username, required this.password});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Movies Page'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.logout),
//             onPressed: () {
//               // Remove saved credentials
//               // await CredentialUtils.removeSavedCredentials();
//
//               // Navigate back to the login page
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => Loginc()),
//               );
//             },
//           ),
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text('Welcome to Another Page!'),
//             SizedBox(height: 20),
//             Text('Username: $username'),
//             Text('Password: $password'),
//           ],
//         ),
//       ),
//     );
//   }
// }
// class MoviePage extends StatefulWidget {
//   final String username;
//   final String password;
//
//   MoviePage({required this.username, required this.password});
//
//   @override
//   _MoviePageState createState() => _MoviePageState();
// }
//
// class _MoviePageState extends State<MoviePage> {
//   Future<List<Character>> charactersFuture = getCharacters();
//
//   static Future<List<Character>> getCharacters() async {
//     var url = Uri.parse("https://marauderapi.fr/api/characters?page=2");
//     final response = await http.get(url, headers: {"Content-Type": "application/json"});
//
//     if (response.statusCode == 200) {
//       final List<dynamic> items = json.decode(response.body)['items'];
//       return items.map((e) => Character.fromJson(e)).toList();
//     } else {
//       print("Failed to load data. Status code: ${response.statusCode}");
//       return [];
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Movies Page'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.logout),
//             onPressed: () async{
//               // Remove saved credentials
//               await CredentialUtils.removeSavedCredentials();
//
//               // Navigate back to the login page
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => Save()),
//               );
//             },
//           ),
//         ],
//       ),
//       body: Center(
//         child: FutureBuilder<List<Character>>(
//           future: charactersFuture,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const CircularProgressIndicator();
//             } else if (snapshot.hasData) {
//               final characters = snapshot.data!;
//               return buildCharacters(characters);
//             } else {
//               return const Text("No data available");
//             }
//           },
//         ),
//       ),
//     );
//   }
//
//   Widget buildCharacters(List<Character> characters) {
//     return GridView.builder(
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         crossAxisSpacing: 10.0,
//         mainAxisSpacing: 10.0,
//       ),
//       itemCount: characters.length,
//       itemBuilder: (context, index) {
//         final character = characters[index];
//         return Container(
//           color: Colors.grey.shade300,
//           padding: EdgeInsets.all(5),
//           child: Image.network(
//             character.picture!,
//             fit: BoxFit.cover,
//           ),
//         );
//       },
//     );
//   }
// }
class MoviePages extends StatefulWidget {
  final String username;
  final String password;

  MoviePages({required this.username, required this.password});
  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePages> {
  late Future<CharacterResponse> charactersFuture;

  @override
  void initState() {
    super.initState();
    charactersFuture = getCharacters();
  }

  Future<CharacterResponse> getCharacters() async {
    var url = Uri.parse("https://marauderapi.fr/api/characters?page=2");
    final response = await http.get(url, headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      final Map<String, dynamic> body = json.decode(response.body);
      return CharacterResponse.fromJson(body);
    } else {
      throw Exception('Failed to load characters');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async{
              // Remove saved credentials
              await CredentialUtils.removeSavedCredentials();

              // Navigate back to the login page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Save()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder<CharacterResponse>(
          future: charactersFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else if (snapshot.hasData) {
              final characterResponse = snapshot.data!;
              return buildCharacters(characterResponse.items);
            } else {
              return const Text("No data available");
            }
          },
        ),
      ),
    );
  }

  Widget buildCharacters(List<Character> characters) {
    return ListView.builder(
      itemCount: characters.length,
      itemBuilder: (context, index) {
        final character = characters[index];
        return Container(
          color: Colors.grey.shade300,
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          height: 100,
          width: double.maxFinite,
          child: Row(
            children: [
              Expanded(flex: 1, child: Image.network(character.picture)),
              SizedBox(width: 10),
              Expanded(flex: 3, child: Text(character.firstName)),
            ],
          ),
        );
      },
    );
  }
}









