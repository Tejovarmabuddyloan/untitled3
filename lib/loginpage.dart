import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'loginpagec.dart';

class CredentialUtils {
  static Future<void> saveCredentials(String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username);
    prefs.setString('password', password);
  }

  static Future<String?> getSavedUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('username');
  }

  static Future<String?> getSavedPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('password');
  }
  static Future<void> removeSavedCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('username');
    prefs.remove('password');
  }
}

class Save extends StatelessWidget {
  const Save({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Design',
      home: const MyDesign(),
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

  @override
  void initState() {
    super.initState();
    _loadCredentials();
  }

  void _loadCredentials() async {
    String? savedUsername = await CredentialUtils.getSavedUsername();
    String? savedPassword = await CredentialUtils.getSavedPassword();

    setState(() {
      usernameController.text = savedUsername ?? "";
      passwordController.text = savedPassword ?? "";
    });
  }

  void _saveCredentials(BuildContext context) async {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      setState(() {
        errorText = "Fields cannot be empty";
      });
      return;
    }

    await CredentialUtils.saveCredentials(usernameController.text, passwordController.text);

    usernameController.clear();
    passwordController.clear();
    setState(() {
      errorText = ""; // Clear error message if saving is successful
    });

    // Navigate to another page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Loginc()),
    );


  }

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
                          errorText = "Fields are 9";
                        });
                      } else {
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
                // Save Button
                ElevatedButton(
                  onPressed: () {
                    _saveCredentials(context);
                  },
                  child: const Text('Save'),
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


