import 'package:flutter/material.dart';

class GestureConflictListenerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GestureConflictListenerState();
}

class GestureConflictListenerState extends State<GestureConflictListenerPage> {
  double _leftB = 0.0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("GestureConflictListenerPage"),
        ),
        body: Stack(
          children: <Widget>[
            Positioned(
                top: 80.0,
                left: _leftB,
                child: Listener(
                  onPointerDown: (details) {
                    print("down");
                  },
                  onPointerUp: (details) {
                    //会触发
                    print("up");
                  },
                  child: GestureDetector(
                    child: CircleAvatar(
                      child: Text("B"),
                    ),
                    onHorizontalDragUpdate: (DragUpdateDetails details) {
                      setState(() {
                        _leftB += details.delta.dx;
                      });
                    },
                    onHorizontalDragEnd: (details) {
                      print("onHorizontalDragEnd");
                    },
                  ),
                )),
          ],
        ));
  }
}
