import 'package:flutter/material.dart';

import 'AnimatedSwitcherCounterRoute.dart';

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
        ],
      ),
    );
  }
}
