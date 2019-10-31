import 'package:flutter/material.dart';
import 'file_operate/FileOperationPage.dart';
import 'http_request/HttpTestPage.dart';
import 'http_request_dio/dioHttpRequestPage.dart';

class FileNetWorkRoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("AcvancedRoutePage"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return FileOperationPage();
              }));
            },
            child: Text("文件操作"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return HttpTestPage();
              }));
            },
            child: Text("Http请求-HttpClient"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return DioHttpRequestPage();
              }));
            },
            child: Text("DioHttp请求(Issue)"),
          ),
        ],
      ),
    );
  }
}
