import 'package:flutter/material.dart';

import 'listViewNotificationListenerPage.dart';
import 'notificationPage.dart';
import 'notificationRoutePagePreventBubble.dart';

class NotificationRoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("AcvancedRoutePage"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return ListViewNotificationListenerPage();
              }));
            },
            child: Text("ListViewNotificationListenerPage"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return NotificationPage();
              }));
            },
            child: Text("NotificationPage"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return NotificationRoutePreventBubblePage();
              }));
            },
            child: Text("NotificationRoutePreventBubblePage"),
          ),
        ],
      ),
    );
  }
}
