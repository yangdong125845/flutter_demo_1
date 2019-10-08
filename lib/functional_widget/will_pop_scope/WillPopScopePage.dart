import 'package:flutter/material.dart';

class WillPopScopePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new WillPopScopePageState();
}

class WillPopScopePageState extends State<WillPopScopePage> {
  DateTime _lastPressedAt; //上次点击时间
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("WillPopScopePage"),
      ),
      body: new WillPopScope(
          child: Container(
            alignment: Alignment.center,
            child: Text("1秒内连续按两次返回键退出"),
          ),
          onWillPop: () async {
            if (_lastPressedAt == null ||
                DateTime.now().difference(_lastPressedAt) >
                    Duration(seconds: 1)) {
              //两次点击间隔超过1秒则重新计时
              _lastPressedAt = DateTime.now();
              return false;
            }
            return true;
          }),
    );
  }
}
