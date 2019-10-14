import 'package:flutter/material.dart';

class StreamBuilderPage extends StatelessWidget {
  Stream<int> counter() {
    return Stream.periodic(Duration(seconds: 1), (i) {
      return i;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("StreamBuilderPage"),
      ),
      body: Center(
        child: StreamBuilder(
            stream: counter(),
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              }
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Text("等待数据...");
                case ConnectionState.active:
                  return Text("active:${snapshot.data}");
                case ConnectionState.done:
                  return Text("Stream已关闭");
                case ConnectionState.none:
                  return Text("没有Stream");
              }
              return null; //unreachable
            }),
      ),
    );
  }
}
