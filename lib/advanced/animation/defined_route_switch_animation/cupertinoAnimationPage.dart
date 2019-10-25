import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'pageB.dart';

class CupertinoAnimationRoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("动画"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(new CupertinoPageRoute(builder: (context) {
                return PageB();
              }));
            },
            child: Text("PageB"),
          ),
        ],
      ),
    );
  }
}
