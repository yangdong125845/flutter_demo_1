import 'package:flutter/material.dart';

class InheritedProvider<T> extends InheritedWidget {
  InheritedProvider({@required this.data, Widget child}) : super(child: child);

  //共享状态使用泛型
  final T data;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // 在此简单返回true，则每次更新都会调用依赖其的子孙结点的“didChangeDependencies”。
    return true;
  }
}
