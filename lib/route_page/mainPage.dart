import 'package:flutter/material.dart';
import 'package:flutter_app_1/advanced/event_handing_and_notification/notification/notificationRoutePagePreventBubble.dart';

import 'package:flutter_app_1/advanced/advancedRoutePage.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("MainRoute"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            onPressed: () {},
            child: Text("入门篇"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return AdvancedRoutePage();
              }));
            },
            child: Text("进阶篇"),
          ),
        ],
      ),
    );
  }
}
