import 'package:flutter/material.dart';

import 'MyIcons.dart';

class IconShow extends StatelessWidget {
  IconShow({Key key}) : super(key: key);

  String icons = "\uE914\uE000\uE90D";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("ICON"),
      ),
      body: new Center(
          child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            icons,
            style: TextStyle(
                fontFamily: "MaterialIcons",
                fontSize: 24.0,
                color: Colors.green),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.accessible,
                color: Colors.green,
              ),
              Icon(
                Icons.error,
                color: Colors.red,
              ),
              Icon(
                Icons.fingerprint,
                color: Colors.blueAccent,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                MyIcons.book,
                color: Colors.blue,
              ),
              Icon(
                MyIcons.wechat,
                color: Colors.green,
              )
            ],
          )
        ],
      )),
    );
  }
}
