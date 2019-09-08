import 'package:flutter/material.dart';
import 'package:flutter_app_1/state_manage/tapboxB.dart';

class ParentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
        child: new TapboxB(
      active: _active,
      onChanged: _handleTapboxChanged,
    ));
  }
}
