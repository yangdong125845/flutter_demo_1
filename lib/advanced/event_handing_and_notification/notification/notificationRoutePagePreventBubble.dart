import 'package:flutter/material.dart';

import 'myNotification.dart';

class NotificationRoutePreventBubblePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new PreventBubbleNotificationState();
}

class PreventBubbleNotificationState
    extends State<NotificationRoutePreventBubblePage> {
  String _msg = "";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("PreventBubbleNotificationPage"),
      ),
      body: NotificationListener<MyNotification>(
          onNotification: (notification) {
            print(notification.msg); //打印通知
            return false;
          },
          child: NotificationListener<MyNotification>(
            onNotification: (notification) {
              setState(() {
                _msg += notification.msg + " ";
              });
              return false;
            },
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
//              RaisedButton(
//                onPressed: () => MyNotification("Hi").dispatch(context),
//                child: Text("Send NOtification"),
//              ),
                  Builder(
                    builder: (context) {
                      return RaisedButton(
                        onPressed: () => MyNotification("Hi").dispatch(context),
                        child: Text("Send Notification"),
                      );
                    },
                  ),
                  Text(_msg)
                ],
              ),
            ),
          )),
    );
  }
}
