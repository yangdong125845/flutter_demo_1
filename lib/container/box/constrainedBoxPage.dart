import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ConstrainedBoxPage extends StatelessWidget {
  Widget redBox = DecoratedBox(
    decoration: BoxDecoration(color: Colors.red),
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("ConstrainedBox"),
        actions: <Widget>[
          UnconstrainedBox(
            child: Padding(
              padding: EdgeInsets.only(right: 20),
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation(Colors.white70),
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: double.infinity, minHeight: 50.0 //最小高度为50像素
                ),
            child: Container(
              height: 5.0,
              child: redBox,
            ),
          ),
          SizedBox(
            width: 80.0,
            height: 80.0,
            child: redBox,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 60.0, minHeight: 60.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),
              child: redBox,
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: 60.0, minHeight: 60.0),
              child: redBox,
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 60.0, minHeight: 100.0), //父
            child: UnconstrainedBox(
              //"去除"父极限值
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),
                //子
                child: redBox,
              ),
            ),
          )
        ],
      ),
    );
  }
}
