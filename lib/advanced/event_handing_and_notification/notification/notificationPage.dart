import 'package:flutter/material.dart';

import 'myNotification.dart';

class NotificationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new NotificationRoutePageState();
}

class NotificationRoutePageState extends State<NotificationPage> {
  String _msg = "";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("NotificationRoutePage"),
      ),
      body: NotificationListener<MyNotification>(
        onNotification: (notification) {
          setState(() {
            _msg += notification.msg + "  ";
          });
          return true;
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
      ),
    );
  }
}
