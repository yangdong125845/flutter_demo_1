import 'package:flutter/material.dart';

class ListViewFlexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("添加固定列表头"),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text("商品列表"),
          ),
          Expanded(
            child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text("$index"),
              );
            }),
          )
        ],
      ),
    );
  }
}
