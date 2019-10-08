import 'package:flutter/material.dart';

import '../changeNotifierProvider.dart';
import 'CartModel.dart';
import 'Item.dart';

class ProviderRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProviderRouteState();
}

class _ProviderRouteState extends State<ProviderRoute> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("ProviderRoute"),
      ),
      body: Center(
        child: ChangeNotifierProvider<CartModel>(
          data: CartModel(),
          child: Builder(builder: (context) {
            print("child build");
            return Column(
              children: <Widget>[
                Builder(builder: (context) {
                  print("Text build");
                  var cart = ChangeNotifierProvider.of<CartModel>(context);
                  return Text("总价: ${cart.totalPrice}");
                }),
                Builder(builder: (context) {
                  print("RaiseButton build"); //在后面优化部分用到
                  return RaisedButton(
                    onPressed: () {
                      //给购物车中添加商品，添加后总价会更新
                      ChangeNotifierProvider.of<CartModel>(context)
                          .add(Item(20.0, 1));
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
