import 'package:flutter/material.dart';

class ScaleAnimationListenerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScaleAnimationListenerPageState();
}

//需要继承TickerProvider,如果多个AnimationController，则应该使用TickerProviderStateMixin.
class _ScaleAnimationListenerPageState extends State<ScaleAnimationListenerPage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new AnimationController(
        vsync: this, duration: const Duration(seconds: 1));
    //图片宽高从0变到300
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //动画执行结束时反向执行动画
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        //动画恢复发哦初始状态时执行动画（正向）
        controller.forward();
      }
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
