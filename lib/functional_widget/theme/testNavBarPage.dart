import 'package:flutter/material.dart';

import 'navBar.dart';

class TestNavBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("TestNavBarPage"),
      ),
      body: Column(
        children: <Widget>[
          //背景为蓝色，则title自动为白色
          NavBar(
            color: Colors.blue,
            title: "标题",
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
          //背景为白色，则title自动为黑色
          NavBar(
            color: Colors.white,
            title: "标题",
          )
        ],
      ),
    );
  }
}
