import 'package:flutter/material.dart';

class ListViewSizedBoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AppBar appBar = AppBar(
      title: Text("用SizedBox的固定列表头"),
    );
    return Scaffold(
        appBar: appBar,
        body: Column(
          children: <Widget>[
            ListTile(
              title: Text("商品列表"),
            ),
            SizedBox(
              //Material设计规范中状态栏,导航栏,ListTile高度分别为24,56,56
              height: MediaQuery.of(context).size.height -
                  24 -
                  56 -
                  56 -
                  appBar.preferredSize.height,
              child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text("$index"),
                );
              }),
            ),
          ],
        ));
  }
}
