import 'package:flutter/material.dart';

import '../../changeNotifierProvider.dart';

class Consumer<T> extends StatelessWidget {
  Consumer({Key key, @required this.builder, this.child})
      : assert(builder != null),
        super(key: key);

  final Widget child;

  final Widget Function(BuildContext context, T value) builder;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return builder(context, ChangeNotifierProvider.of<T>(context)); //自动获取Model
  }
}
