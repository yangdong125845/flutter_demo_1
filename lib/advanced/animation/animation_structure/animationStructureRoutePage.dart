import 'package:flutter/material.dart';

import 'ScaleAnimationCurvePage.dart';
import 'ScaleAnimationListenerPage.dart';
import 'ScaleAnimationPage.dart';
import 'growTransitionAnimatedBuilderPage.dart';
import 'scaleAnimatedBuilderListenerPage.dart';
import 'scaleAnimatedBuilderPage.dart';
import 'scaleAnimatedWidgetPage.dart';
import 'scaleAnimatedWidgetPage1.dart';

class AnimationStructureRoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("动画结构"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return ScaleAnimationPage();
              }));
            },
            child: Text("ScaleAnimationPage"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return ScaleCurveAnimationPage();
              }));
            },
            child: Text("ScaleCurveAnimationPage"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return ScaleAnimatedWidgetPage();
              }));
            },
            child: Text("ScaleAnimatedWidgetPage"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return ScaleAnimatedBuilderPage();
              }));
            },
            child: Text("ScaleAnimatedBuilderPage"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return GrowTransitionAnimatedBuilderPage();
              }));
            },
            child: Text("GrowTransitionAnimatedBuilderPage"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return ScaleAnimatedWidgetPage1();
              }));
            },
            child: Text("无效的改编的ScaleAnimatedWidgetPage1"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return ScaleAnimationListenerPage();
              }));
            },
            child: Text("ScaleAnimationListenerPage"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return ScaleAnimatedBuilderListenerPage();
              }));
            },
            child: Text("ScaleAnimatedBuilderListenerPage"),
          ),
        ],
      ),
    );
  }
}
