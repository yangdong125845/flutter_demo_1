import 'package:flutter/material.dart';
import 'package:flutter_app_1/advanced/event_handing_and_notification/eventHandNotificationRoutePage.dart';

import 'combination_widget/GradientButtonPage.dart';
import 'custom_gradient_circular_progress_indicator/GrdientCircularProgressPage.dart';
import 'custompaint_canvas_widget/CustomPaintPage.dart';
import 'turnbox/TurnBoxPage.dart';

class CustomWidgetRoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("AcvancedRoutePage"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return GradientButtonPage();
              }));
            },
            child: Text("组合现有组件"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return TurnBoxPage();
              }));
            },
            child: Text("组合实例：TurnBox"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return CustomPaintPage();
              }));
            },
            child: Text("自绘组件（CustomPaint与Canvas）"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return GradientCircularProgressPage();
              }));
            },
            child: Text("自绘实例：圆形背景渐变进度条"),
          ),
        ],
      ),
    );
  }
}
