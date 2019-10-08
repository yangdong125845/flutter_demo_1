import 'package:flutter/material.dart';

import 'ShareDataWidget.dart';
import '_TestWidget.dart';

class InheritedWidgetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _InheritedWidgetPageState();
}

class _InheritedWidgetPageState extends State<InheritedWidgetPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("InheritedWidget"),
      ),
      body: Center(
        child: ShareDataWidget(
          //使用ShareDataWidget
          data: count,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: TestWidget(), // 子widget中依赖ShareDataWidget
              ),
              RaisedButton(
                onPressed: () => setState(() => ++count),
                child: Text("Increment"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
