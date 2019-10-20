import 'package:flutter/material.dart';
import 'package:flutter_app_1/advanced/event_handing_and_notification/notification/notificationRoutePage.dart';

class EventHandAndNotificationRoutePage extends StatelessWidget {
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
                return NotificationRoutePage();
              }));
            },
            child: Text("通知"),
          ),
        ],
      ),
    );
  }
}
