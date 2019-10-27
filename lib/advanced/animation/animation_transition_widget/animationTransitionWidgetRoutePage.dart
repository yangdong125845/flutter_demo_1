import 'package:flutter/material.dart';
import 'package:flutter_app_1/advanced/animation/animated_switcher/BossAnimatedSwitcherCounterRoute.dart';

import 'AnimatedDecoratedBox1Page.dart';
import 'animatedWidgetsTestPage.dart';

class AnimationTransitionWidgetRoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedDecoratedBox"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return AnimatedDecoratedBox1Page();
              }));
            },
            child: Text("AnimatedDecoratedBox(Issue)"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return AnimatedWidgetsTestPage();
              }));
            },
            child: Text("AnimatedWidgetsTestPage"),
          ),
        ],
      ),
    );
  }
}
