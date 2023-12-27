import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'second_page.dart';
import 'provider.dart';



class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
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
            Consumer<ChangeNameProvider>(
              builder: (context, newNameProvider, child) {
                return Text('Name: ${newNameProvider.NewName}');
              },
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Page2()),
                );
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
