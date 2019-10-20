import 'package:flutter/material.dart';

class ListViewNotificationListenerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("ListViewNotificationListenerPage"),
      ),
      body: NotificationListener(
        child: ListView.builder(itemBuilder: (context, index) {
          return ListTile(
            title: Text("$index"),
          );
        }),
        // ignore: missing_return
        onNotification: (notification) {
          switch (notification.runtimeType) {
            case ScrollStartNotification:
              print("开始滚动......................................");
              break;
            case ScrollUpdateNotification:
              print("正在滚动");
              break;
            case ScrollEndNotification:
              print("滚动停止");
              break;
            case OverscrollNotification:
              print("滚动到边界");
              break;
          }
        },
      ),
    );
  }
}
