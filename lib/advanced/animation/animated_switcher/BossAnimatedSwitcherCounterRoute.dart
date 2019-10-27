import 'package:flutter/material.dart';

import 'slideTransitionX.dart';

class BossAnimatedSwitcherCounterRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>
      _BossAnimatedSwitcherCounterRouteState();
}

class _BossAnimatedSwitcherCounterRouteState
    extends State<BossAnimatedSwitcherCounterRoute> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedSwitcherCounterRoute"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (Widget child, Animation<double> animation) {
                var tween = Tween(begin: Offset(1, 0), end: Offset(0, 0));
                return SlideTransitionX(
                  position: animation,
                  direction: AxisDirection.down, //上入下出
                  child: child,
                );
              },
              child: Text(
                "$_count",
                //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
                key: ValueKey<int>(_count),
                style: Theme.of(context).textTheme.display1,
              ),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  _count += 1;
                });
              },
              child: const Text("+1"),
            )
          ],
        ),
      ),
    );
  }
}
