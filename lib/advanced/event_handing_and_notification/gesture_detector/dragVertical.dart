import 'package:flutter/material.dart';

class DragVertical extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _DragVerticalState();
}

class _DragVerticalState extends State<DragVertical> {
  double _top = 100.0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("DragVertical"),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: _top,
            child: GestureDetector(
              child: CircleAvatar(
                child: Text("A"),
              ),
              //垂直方向拖动事件
              onVerticalDragUpdate: (DragUpdateDetails details) {
                setState(() {
                  _top += details.delta.dy;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
