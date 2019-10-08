import 'package:flutter/material.dart';

import '../../InheritedProvider.dart';

//该方法用于在Dart中获取模板类型
Type _typeOf<T>() => T;

/**
 * 那么，现在就带来了一个问题：
 * 实际上，我们只想更新子树中依赖了ShareDataWidget的组件，而现在只要调用_InheritedWidgetTestRouteState的setState()方法，
 * 所有子节点都会被重新build，这很没必要，那么有什么办法可以避免呢？
 * 答案是缓存！一个简单的做法就是通过封装一个StatefulWidget，将子Widget树缓存起来，
 * 具体做法下一节我们将通过实现一个Provider Widget 来演示如何缓存，以及如何利用InheritedWidget 来实现Flutter全局状态共享。
 */
class ChangeNotifierProvider1<T extends ChangeNotifier> extends StatefulWidget {
  ChangeNotifierProvider1({Key key, this.data, this.child});

  final Widget child;
  final T data;

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static T of<T>(BuildContext context, {bool listen = true}) {
    final type = _typeOf<InheritedProvider<T>>();
    final provider = listen
        ? context.inheritFromWidgetOfExactType(type) as InheritedProvider<T>
        : context.ancestorInheritedElementForWidgetOfExactType(type)?.widget
            as InheritedProvider<T>;
    return provider.data;
  }

  @override
  State<StatefulWidget> createState() => _ChangeNotifierProviderState1<T>();
}

class _ChangeNotifierProviderState1<T extends ChangeNotifier>
    extends State<ChangeNotifierProvider1<T>> {
  void update() {
    //如果数据发生变化（model类调用了notifyListeners), 重新构建InheritedProvider
    setState(() {});
  }

  @override
  void didUpdateWidget(ChangeNotifierProvider1<T> oldWidget) {
    // 当Provider更新时，如果新旧数据不“==”，则解绑旧数据监听，同时添加新数据监听
    if (widget.data != oldWidget.data) {
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    // 给model添加监视器
    widget.data.addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    // 移除model的监听器
    widget.data.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InheritedProvider<T>(
      data: widget.data,
      child: widget.child,
    );
  }
}
