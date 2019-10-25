import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'pageB.dart';

class PageRouteBuilderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("动画"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              Navigator.of(context).push(PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 500), //动画时间为500毫秒
                  pageBuilder: (BuildContext context, Animation animation,
                      Animation secondaryAnimation) {
                    return new FadeTransition(
                      //使用渐隐渐入过渡
                      opacity: animation,
                      child: PageB(), //路由B
                    );
                  }));
            },
            child: Text("PageB"),
          ),
        ],
      ),
    );
  }
}
