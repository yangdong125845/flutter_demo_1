import 'package:flutter/material.dart';

import 'AnimatedDecoratedBox.dart';

class AnimatedWidgetsTestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnimatedWidgetsTestState();
}

class _AnimatedWidgetsTestState extends State<AnimatedWidgetsTestPage> {
  double _padding = 10;
  var _align = Alignment.topRight;
  double _height = 100;
  double _left = 0;
  Color _color = Colors.red;
  TextStyle _style = TextStyle(color: Colors.black);
  Color _decorationColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    var duration = Duration(seconds: 5);
    return Scaffold(
      appBar: AppBar(
        title: Text("预置的动画过渡组件"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                setState(() {
                  _padding = 20;
                });
              },
              child: AnimatedPadding(
                padding: EdgeInsets.all(_padding),
                duration: duration,
                child: Text("AnimatedPadding"),
              ),
            ),
            SizedBox(
              height: 50,
              child: Stack(
                children: <Widget>[
                  AnimatedPositioned(
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          _left = 100;
                        });
                      },
                      child: Text("AnimatedPositioned"),
                    ),
                    duration: duration,
                    left: _left,
                  ),
                ],
              ),
            ),
            Container(
              height: 100,
              color: Colors.grey,
              child: AnimatedAlign(
                alignment: _align,
                duration: duration,
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      _align = Alignment.center;
                    });
                  },
                  child: Text("AnimatedAlign"),
                ),
              ),
            ),
            AnimatedContainer(
              duration: duration,
              height: _height,
              color: _color,
              child: FlatButton(
                  onPressed: () {
                    setState(() {
                      _height = 150;
                      _color = Colors.blue;
                    });
                  },
                  child: Text(
                    "AnimatedContainer",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            AnimatedDefaultTextStyle(
                child: GestureDetector(
                  child: Text("hello world"),
                  onTap: () {
                    setState(() {
                      _style = TextStyle(
                        color: Colors.blue,
                        decorationStyle: TextDecorationStyle.solid,
                        decorationColor: Colors.orange,
                      );
                    });
                  },
                ),
                style: _style,
                duration: duration),
            AnimatedDecoratedBox()
          ],
        ),
      ),
    );
  }
}
