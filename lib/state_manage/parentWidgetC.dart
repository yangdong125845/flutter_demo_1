import 'package:flutter/material.dart';
import 'package:flutter_app_1/state_manage/tapboxC.dart';

class ParentWidgetC extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _ParentWidgetCState();
}

class _ParentWidgetCState extends State<ParentWidgetC> {
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
      child: new TapboxC(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}
