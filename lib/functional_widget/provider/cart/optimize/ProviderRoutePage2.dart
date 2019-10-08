import 'package:flutter/material.dart';

import '../CartModel.dart';
import '../Item.dart';
import 'changeNotifierProvider1.dart';
import 'consumer.dart';

class ProviderRoute2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProviderRouteState2();
}

class _ProviderRouteState2 extends State<ProviderRoute2> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("ProviderRoute"),
      ),
      body: Center(
        child: ChangeNotifierProvider1<CartModel>(
          data: CartModel(),
          child: Builder(builder: (context) {
            print("child build");
            return Column(
              children: <Widget>[
                Consumer<CartModel>(
                  builder: (context, cart) => Text("总价：${cart.totalPrice}"),
                ),
                Builder(builder: (context) {
                  print("RaiseButton build"); //在后面优化部分用到
                  return RaisedButton(
                    onPressed: () {
                      //给购物车中添加商品，添加后总价会更新
                      //listen设为false,不建立依赖关系
                      ChangeNotifierProvider1.of<CartModel>(context,
                              listen: false)
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
