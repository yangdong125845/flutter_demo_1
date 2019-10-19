import 'package:flutter/material.dart';

class ScaleStatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _ScaleState();
}

class _ScaleState extends State<ScaleStatePage> {
  double _width = 200.0; //通过修改图片宽度来达到缩放效果
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("ScaleStatePage"),
      ),
      body: Center(
        child: GestureDetector(
          //指定宽度，高度自适应
          child: Image.asset(
            "./images/portrait.png",
            width: _width,
          ),
          onScaleUpdate: (ScaleUpdateDetails details) {
            setState(() {
              //缩放倍数在0.8到10倍之间
              _width = 200 * details.scale.clamp(.8, 10.0);
            });
          },
        ),
      ),
    );
  }
}
