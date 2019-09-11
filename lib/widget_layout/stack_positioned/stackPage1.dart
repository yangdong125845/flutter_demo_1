import 'package:flutter/material.dart';

class StackPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack1布局"),
      ),
      //通过ConstrainedBox来确保Stack沾满屏幕
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand, //未定位widget占满Stack整个空间
        children: <Widget>[
          Positioned(
            left: 18.0,
            child: Text("I am Jack"),
          ),
          Container(
            color: Colors.blue,
            child: Text(
              "Hello world",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Positioned(
            top: 18.0,
            child: Text("Your friend"),
          )
        ],
      ),
    );
  }
}
