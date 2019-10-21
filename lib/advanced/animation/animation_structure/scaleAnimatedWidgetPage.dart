import 'package:flutter/material.dart';

import 'AnimatedImage.dart';

class ScaleAnimatedWidgetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScaleAnimatedWidgetPageState();
}

class _ScaleAnimatedWidgetPageState extends State<ScaleAnimatedWidgetPage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    //图片宽高从0变到300
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller);
    //启动动画
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedWidget"),
      ),
      body: AnimatedImage(animation: animation),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose(); //路由销毁时需要释放动画资源
  }
}
