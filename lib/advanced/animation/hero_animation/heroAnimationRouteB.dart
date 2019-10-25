import 'package:flutter/material.dart';

class HeroAnimationRouteB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Hero(
          tag: "avator", //唯一标记，前后两个路由页Hero的tag必须相同
          child: Image.asset("images/portrait.png")),
    );
  }
}
