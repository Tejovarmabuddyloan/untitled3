import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'modalapicall.dart';

class MoviePages extends StatefulWidget {
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
