import 'package:flutter/material.dart';

class TapboxA extends StatefulWidget {
  TapboxA({Key key}) : super(key:key);

  @override
  State<StatefulWidget> createState() =>new _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: _handleTap ,
      child: new Container(
        child: new Center(
          child: new Text(
            _active ? "Active" :"Inactive",
            style: new TextStyle(fontSize: 32.0,color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: _active ?Colors.lightGreen[700] :Colors.grey[600],
        ),
      ),
    );
  }

}
