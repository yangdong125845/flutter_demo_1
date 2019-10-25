import 'package:flutter/material.dart';

import 'cupertinoAnimationPage.dart';
import 'pageRouteBuilderPage.dart';
import 'pageRoutePage.dart';
import 'pageRoutePage1.dart';

class SwitchAnimationPage extends StatelessWidget {
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
                  .push(new MaterialPageRoute(builder: (context) {
                return CupertinoAnimationRoutePage();
              }));
            },
            child: Text("CupertinoAnimationRoutePage"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return PageRouteBuilderPage();
              }));
            },
            child: Text("PageRouteBuilderPage"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return PageRoutePage();
              }));
            },
            child: Text("PageRoutePage"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return PageRoutePage1();
              }));
            },
            child: Text("PageRoutePage1"),
          ),
        ],
      ),
    );
  }
}
