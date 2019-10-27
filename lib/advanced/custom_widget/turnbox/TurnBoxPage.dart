import 'package:flutter/material.dart';

import 'TurnBox.dart';

class TurnBoxPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _TurnBoxState();
}

class _TurnBoxState extends State<TurnBoxPage> {
  double _turns = .0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("TurnBox"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TurnBox(
              turns: _turns,
              speed: 500,
              child: Icon(
                Icons.refresh,
                size: 50,
              ),
            ),
            TurnBox(
              turns: _turns,
              speed: 1000,
              child: Icon(
                Icons.refresh,
                size: 150.0,
              ),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  _turns += .2;
                });
              },
              child: Text("顺时针旋转1/5圈"),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  _turns -= .2;
                });
              },
              child: Text("逆时针旋转1/5圈"),
            )
          ],
        ),
      ),
    );
  }
}
