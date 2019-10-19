import 'package:flutter/material.dart';

class GestureConflictPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GestureConflictPageState();
}

class GestureConflictPageState extends State<GestureConflictPage> {
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("GestureConflictPage"),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
              left: _left,
              child: GestureDetector(
                child: CircleAvatar(
                  child: Text("A"),
                ),
                //要拖动和点击的widget

                onHorizontalDragUpdate: (DragUpdateDetails details) {
                  setState(() {
                    _left += details.delta.dx;
                  });
                },
                onHorizontalDragEnd: (details) {
                  print("onHorizontalDragEnd");
                },
                onTapDown: (details) {
                  print("down");
                },
                onTapUp: (details) {
                  print("up");
                },
              ))
        ],
      ),
    );
  }
}
