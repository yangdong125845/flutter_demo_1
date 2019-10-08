import 'package:flutter/material.dart';

class ScrollNotificationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _ScrollNotificationPageState();
}

class _ScrollNotificationPageState extends State<ScrollNotificationPage> {
  String _progress = "0%"; //保存进度百分比

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("ScrollNOtification"),
      ),
      body: Scrollbar(
        //进度条
        //监听滚动通知
        child: NotificationListener<ScrollNotification>(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("$index"),
                  );
                },
                itemCount: 100,
                itemExtent: 50.0,
              ),
              CircleAvatar(
                //显示进度百分比
                radius: 30.0,
                child: Text(_progress),
                backgroundColor: Colors.black54,
              )
            ],
          ),
          onNotification: (ScrollNotification notification) {
            double progress = notification.metrics.pixels /
                notification.metrics.maxScrollExtent;
            //重新构建
            setState(() {
              _progress = "${(progress * 100).toInt()}%";
            });
            print("BottomEdge: ${notification.metrics.extentAfter == 0}");
            //return true; //放开此行注释后，进度条将失效
          },
        ),
      ),
    );
  }
}
