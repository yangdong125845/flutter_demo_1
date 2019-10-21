import 'package:flutter/material.dart';

import 'AnimatedImage.dart';
import 'GrowTransition.dart';

class GrowTransitionAnimatedBuilderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>
      _GrowTransitionAnimatedBuilderPageState();
}

class _GrowTransitionAnimatedBuilderPageState
    extends State<GrowTransitionAnimatedBuilderPage>
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
      body: GrowTransition(
          child: Image.asset("images/portrait.png"), animation: animation),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose(); //路由销毁时需要释放动画资源
  }
}
