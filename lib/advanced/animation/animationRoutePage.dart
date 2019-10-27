import 'package:flutter/material.dart';

import 'animated_switcher/animationSwitcherPage.dart';
import 'animation_structure/animationStructureRoutePage.dart';
import 'animation_transition_widget/animationTransitionWidgetRoutePage.dart';
import 'defined_route_switch_animation/switchAnimationPage.dart';
import 'hero_animation/heroAnimationRoute.dart';
import 'stagger_animation/StaggerRoute.dart';

class AnimationRoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("动画"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return AnimationStructureRoutePage();
              }));
            },
            child: Text("动画结构"),
          ),

          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return SwitchAnimationPage();
              }));
            },
            child: Text("自定义路由过渡动画"),
          ),

          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return HeroAnimationRoute();
              }));
            },
            child: Text("Hero动画"),
          ),

          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return StaggerRoute();
              }));
            },
            child: Text("交织动画"),
          ),

          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return AnimationSwitcherPage();
              }));
            },
            child: Text("通用“切换动画”组件"),
          ),

          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return AnimationTransitionWidgetRoutePage();
              }));
            },
            child: Text("动画过渡组件"),
          ),
        ],
      ),
    );
  }
}
