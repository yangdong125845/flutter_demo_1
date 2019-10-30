import 'package:flutter/material.dart';
import 'file_operate/FileOperationPage.dart';

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
        ],
      ),
    );
  }
}
