import 'package:flutter/material.dart';

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: AnimatedBuilder(
          animation: animation,
          child: child,
          builder: (BuildContext context, Widget child) {
            return new Container(
              height: animation.value,
              width: animation.value,
              child: child,
            );
          }),
    );
  }
}
