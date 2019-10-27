import 'package:flutter/material.dart';

import 'AnimatedDecoratedBox1.dart';

class AnimatedDecoratedBox1Page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnimatedDecoratedBox1PageState();
}

class _AnimatedDecoratedBox1PageState extends State<AnimatedDecoratedBox1Page> {
  @override
  Widget build(BuildContext context) {
    Color _decorationColor = Colors.blue;
    var duration = Duration(seconds: 1);
    return Scaffold(
      appBar: AppBar(
        title: Text("自定义动画过渡组件"),
      ),
      body: Center(
          child: AnimatedDecoratedBox1(
        duration: duration,
        decoration: BoxDecoration(color: _decorationColor),
        child: FlatButton(
            onPressed: () {
              setState(() {
                _decorationColor = Colors.red;
              });
            },
            child: Text(
              "AnimatedDecoratedBox1",
              style: TextStyle(color: Colors.white),
            )),
      )),
    );
  }
}
