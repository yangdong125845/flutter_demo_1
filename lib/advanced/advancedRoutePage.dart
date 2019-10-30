import 'package:flutter/material.dart';
import 'animation/animationRoutePage.dart';
import 'custom_widget/customWidgetRoutePage.dart';
import 'event_handing_and_notification/eventHandNotificationRoutePage.dart';
import 'file_operate_and_network_request/fileNetworkRoutePage.dart';

class AdvancedRoutePage extends StatelessWidget {
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
                return EventHandAndNotificationRoutePage();
              }));
            },
            child: Text("事件处理与通知"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return AnimationRoutePage();
              }));
            },
            child: Text("动画(最后一小节...)"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return CustomWidgetRoutePage();
              }));
            },
            child: Text("自定义组件"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return FileNetWorkRoutePage();
              }));
            },
            child: Text("文件操作与网络请求"),
          ),
        ],
      ),
    );
  }
}
