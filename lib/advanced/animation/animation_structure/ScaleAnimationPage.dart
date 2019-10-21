import 'package:flutter/material.dart';

class ScaleAnimationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScaleAnimationPageState();
}

//需要继承TickerProvider,如果多个AnimationController，则应该使用TickerProviderStateMixin.
class _ScaleAnimationPageState extends State<ScaleAnimationPage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new AnimationController(
        vsync: this, duration: const Duration(seconds: 3));
    //图片宽高从0变到300
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });

    //启动动画（正向执行）
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("ScaleAnimationPage"),
      ),
      body: Center(
        child: Image.asset(
          "images/portrait.png",
          width: animation.value,
          height: animation.value,
        ),
      ),
    );
  }

  @override
  void dispose() {
    // 路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}
