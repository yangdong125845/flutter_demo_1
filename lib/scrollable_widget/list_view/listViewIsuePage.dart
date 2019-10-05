import 'package:flutter/material.dart';

class ListViewIsuePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    //The following assertion was thrown during performResize():
    //Vertical viewport was given unbounded height.

    return Scaffold(
      appBar: AppBar(
        title: Text("有问题的添加固定列表头"),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text("商品列表"),
          ),
          ListView.builder(itemBuilder: (context, index) {
            return ListTile(
              title: Text("$index"),
            );
          })
        ],
      ),
    );
  }
}
