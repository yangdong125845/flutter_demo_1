import 'package:flutter/material.dart';
import 'package:flutter_app_1/advanced/event_handing_and_notification/eventHandNotificationRoutePage.dart';

import 'camerasPage.dart';
import 'platformViewPage.dart';

class PackagePluginRoutePage extends StatelessWidget {
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
          Text("batterylevel_java示例"),
          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return CameraExampleHome();
              }));
            },
            child: Text("Texture（示例：使用摄像头）"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return PlatformViewPage();
              }));
            },
            child: Text(" PlatformView （示例：WebView）"),
          ),
        ],
      ),
    );
  }
}
