import 'package:flutter/material.dart';

class ClipPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //头像
    Widget avatar = Image.asset(
      "images/portrait.png",
      width: 60.0,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Clip"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            avatar, //不裁剪
            ClipOval(
              child: avatar,
            ), //裁剪为圆形
            ClipRRect(
              //裁剪为圆角矩形
              borderRadius: BorderRadius.circular(5.0),
              child: avatar,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight, //试试
                  widthFactor: .5, //宽度设为原来宽度一半，另一半会溢出,
                  child: avatar,
                ),
                Text(
                  "你好世界",
                  style: TextStyle(color: Colors.green),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipRect(
                  //将溢出部分裁剪
                  child: Align(
                    alignment: Alignment.topLeft,
                    widthFactor: .5, //宽度设为原来宽度的一半
                    child: avatar,
                  ),
                ),
                Text(
                  "你好世界",
                  style: TextStyle(color: Colors.green),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
