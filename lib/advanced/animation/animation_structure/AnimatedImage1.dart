import 'package:flutter/material.dart';

class AnimatedImage1 extends AnimatedWidget {
  AnimatedImage1({Key key, this.child, Animation<double> animation})
      : super(key: key, listenable: animation);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Container(
        height: animation.value, width: animation.value, child: child);
  }
}
