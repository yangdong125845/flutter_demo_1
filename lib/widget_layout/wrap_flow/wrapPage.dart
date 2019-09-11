import 'package:flutter/material.dart';

class WrapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Wrap布局"),
        ),
        body: Wrap(
          alignment: WrapAlignment.center, //沿主轴方向居中
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            Wrap(
              spacing: 8.0, //主轴（水平）方向间距
              runSpacing: 4.0, //纵轴（垂直）方向间距
              alignment: WrapAlignment.center, //沿主轴方向居中

              children: <Widget>[
                new Chip(
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue[200],
                    child: Text("A"),
                  ),
                  label: Text("Hamilton"),
                ),
                Chip(
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue[500],
                    child: Text("M"),
                  ),
                  label: Text("Lafayette"),
                ),
                Chip(
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue[700],
                    child: Text("H"),
                  ),
                  label: Text("Mulligan"),
                ),
                Chip(
                  avatar: CircleAvatar(
                      backgroundColor: Colors.blue, child: Text("J")),
                  label: Text(
                    "Laurens",
                    style: TextStyle(fontSize: 15.0),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
