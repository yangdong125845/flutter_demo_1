import 'package:flutter/material.dart';

class FutureBuilderPage extends StatelessWidget {
  Future<String> mockNetworkData() async {
    return Future.delayed(Duration(seconds: 2), () => "我是从互联网上获取的数据");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("FutureBuilderPage"),
      ),
      body: Center(
        child: FutureBuilder(
            future: mockNetworkData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              //请求已结束
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  //请求失败，显示错误
                  return Text("Errror :${snapshot.error}");
                } else {
                  //请求成功，线束数据
                  return Text("Contents: ${snapshot.data}");
                }
              } else {
                //请求未结束，显示loading
                return CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}
