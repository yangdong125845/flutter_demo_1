import 'package:flutter/material.dart';

class TextStyleShow extends StatelessWidget {
  TextStyleShow({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("文本，字体样式"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              "Hello world",
              style: new TextStyle(
                  fontSize: 10,
                  color: Colors.lightGreen,
                  height: 1.2,
                  fontFamily: "Courier",
                  background: new Paint()..color = Colors.lightBlue[200],
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dashed),
              textAlign: TextAlign.left,
            ),
            new Text(
              "Hello world! I'm Jack." * 4,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: new TextStyle(fontSize: 10),
              textAlign: TextAlign.left,
            ),
            new Text(
              "Hello world",
              textScaleFactor: 1.5,
              style: new TextStyle(fontSize: 10),
              textAlign: TextAlign.left,
            ),
            Text.rich(TextSpan(children: [
              TextSpan(text: "Home: "),
              TextSpan(
                text: "https://flutterchina.club",
                style: TextStyle(color: Colors.blue),
              )
            ])),
            DefaultTextStyle(
              //1.设置文本默认样式
              style: TextStyle(
                color: Colors.red[100],
                fontSize: 20.0,
              ),
              textAlign: TextAlign.start,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("hello world"),
                  Text("I am Jack"),
                  Text(
                    "I am Jack",
                    style: TextStyle(
                        inherit: false, //2.不继承默认样式
                        color: Colors.grey),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
