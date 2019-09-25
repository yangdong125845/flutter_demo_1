import 'package:flutter/material.dart';

class AlignPage2 extends StatelessWidget {
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
          alignment: FractionalOffset(0.2, 0.6),
          child: FlutterLogo(
            size: 60,
          ),
        ),
      ),
    );
  }
}
