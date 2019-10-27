import 'package:flutter/material.dart';

import 'GradientButton.dart';

class GradientButtonPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GradientButtonPageState();
}

class _GradientButtonPageState extends State<GradientButtonPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("自定义Button"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            GradientButton(
              colors: [Colors.orange, Colors.red],
              height: 50.0,
              child: Text("Submit"),
              onPressed: onTap,
            ),
            GradientButton(
              height: 50.0,
              colors: [Colors.lightGreen, Colors.green[700]],
              child: Text("Submit"),
              onPressed: onTap,
            ),
            GradientButton(
              height: 50.0,
              colors: [Colors.lightBlue[300], Colors.blueAccent],
              child: Text("Submit"),
              onPressed: onTap,
            )
          ],
        ),
      ),
    );
  }

  onTap() {
    print("button click");
  }
}
