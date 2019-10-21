import 'package:flutter/material.dart';
import 'animation/animationRoutePage.dart';
import 'event_handing_and_notification/eventHandNotificationRoutePage.dart';

class AdvancedRoutePage extends StatelessWidget {
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
                return EventHandAndNotificationRoutePage();
              }));
            },
            child: Text("事件处理与通知"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return AnimationRoutePage();
              }));
            },
            child: Text("动画"),
          ),
        ],
      ),
    );
  }
}
