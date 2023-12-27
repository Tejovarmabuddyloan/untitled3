import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'calculate.dart';
import 'provider.dart';

class Page2 extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Provider.of<NumberProvider>(context, listen: false).updateResult(
        Provider.of<NumberProvider>(context, listen: false).result + 2);

    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<NumberProvider>(
              builder: (context, numberProvider, child) {
                return Text('Number: ${numberProvider.result}');
              },
            ),
            Padding(
              padding: const EdgeInsets.all(19.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Enter new  name',

                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Provider.of<ChangeNameProvider>(context, listen: false).changeUserName(_controller.text);
                    FocusScope.of(context).unfocus();
                    _controller.clear();// Unfocus the keyboard
                  },
                  child: Text('Submit'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Page1()),
                    );
                  },
                  child: Text('Back'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}