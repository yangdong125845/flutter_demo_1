import 'package:flutter/material.dart';

import 'InheritedWidgetPage.dart';

class OutSidePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _OutSidePageState();
}

class _OutSidePageState extends State<OutSidePage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    print("根节点(BuildContext context)--------------------------------");

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("InheritedWidget"),
      ),
      body: Center(
        child: Builder(builder: (context) {
          print(
              "Builder(InheritedWidgetPage的父节点)--------------------------------");
          return InheritedWidgetPage();
        }),
      ),
    );
  }
}
