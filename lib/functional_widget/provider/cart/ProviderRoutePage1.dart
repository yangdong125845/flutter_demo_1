import 'package:flutter/material.dart';
import 'package:flutter_app_1/functional_widget/inherited_widget/ShareDataWidget.dart';
import 'package:flutter_app_1/functional_widget/inherited_widget/_TestWidget.dart';

import '../changeNotifierProvider.dart';
import 'CartModel.dart';
import 'Item.dart';

class ProviderRoute1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProviderRouteState();
}

class _ProviderRouteState extends State<ProviderRoute1> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("ProviderRoute"),
      ),
      body: Center(
        child: ShareDataWidget(
          data: count,
          child: Builder(builder: (context) {
            print("child build");
            return Column(
              children: <Widget>[
                Builder(builder: (context) {
                  print("Text build");
                  return TestWidget();
                }),
                Builder(builder: (context) {
                  print("RaiseButton build"); //在后面优化部分用到
                  return RaisedButton(
                    onPressed: () {
                      //给购物车中添加商品，添加后总价会更新
                      setState(() => ++count);
                    },
                    child: Text("添加商品"),
                  );
                })
              ],
            );
          }),
        ),
      ),
    );
  }
}
