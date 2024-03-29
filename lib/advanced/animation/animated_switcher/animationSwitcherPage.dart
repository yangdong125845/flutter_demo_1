import 'package:flutter/material.dart';

import 'AnimatedSwitcherCounterRoute.dart';
import 'BossAnimatedSwitcherCounterRoute.dart';
import 'SuperAnimatedSwitcherCounterRoute.dart';
import 'SuperAnimatedSwitcherCounterRoute_improve.dart';

class AnimationSwitcherPage extends StatelessWidget {
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
                return AnimatedSwitcherCounterRoute();
              }));
            },
            child: Text("+1动画"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return SuperAnimatedSwitcherCounterRoute();
              }));
            },
            child: Text("高级用法1"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return SuperAnimatedSwitcherCounterRouteSuper();
              }));
            },
            child: Text("高级用法(improve)"),
          ),

          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return BossAnimatedSwitcherCounterRoute();
              }));
            },
            child: Text("高级用法(BOSS)"),
          ),
        ],
      ),
    );
  }
}
