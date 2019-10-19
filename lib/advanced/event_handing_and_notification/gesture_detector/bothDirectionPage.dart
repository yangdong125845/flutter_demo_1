import 'package:flutter/material.dart';

class BothDirectionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BothDirectionPageState();
}

class BothDirectionPageState extends State<BothDirectionPage> {
  double _top = 0.0;
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("BothDirectionPage"),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
              top: _top,
              left: _left,
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
                onHorizontalDragUpdate: (DragUpdateDetails details) {
                  setState(() {
                    _left += details.delta.dx;
                  });
                },
              ))
        ],
      ),
    );
  }
}
