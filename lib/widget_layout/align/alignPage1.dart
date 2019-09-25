import 'package:flutter/material.dart';

class AlignPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Align"),
      ),
      body: Container(
        color: Colors.blue[50],
        child: Align(
          widthFactor: 2,
          heightFactor: 2,
          alignment: Alignment(2, 0.0),
          child: FlutterLogo(
            size: 60,
          ),
        ),
      ),
    );
  }
}
