import 'package:flutter/material.dart';

class StackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack布局"),
      ),
      //通过ConstrainedBox来确保Stack沾满屏幕
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center, //指定未定位活部分定位widget的对齐方式
          children: <Widget>[
            Container(
              color: Colors.blue,
              child: Text(
                "Hello world",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Positioned(
              left: 18.0,
              child: Text("I am Jack"),
            ),
            Positioned(
              top: 18.0,
              child: Text("Your friend"),
            )
          ],
        ),
      ),
    );
  }
}
