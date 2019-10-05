import 'package:flutter/material.dart';

class ListViewPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("ListViewBuilder"),
        ),
        body: ListView.builder(
          itemCount: 100,
          itemExtent: 50.0, //强制高度为50.0,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("$index"),
            );
          },
        ));
  }
}
