import 'package:flutter/material.dart';
import 'package:share/share.dart';





class Sharepage extends StatelessWidget {


  void shareLink(BuildContext context) {
    Share.share('https://www.buddyloan.com/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Link Sharing App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[


            IconButton(
              icon: Icon(Icons.share),
              onPressed: () => shareLink(context),
              tooltip: 'Share Link',
            ),
          ],
        ),
      ),
    );
  }
}
