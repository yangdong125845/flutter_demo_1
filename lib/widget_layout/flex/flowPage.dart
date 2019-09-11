import 'package:flutter/material.dart';

class FlowPage extends StatelessWidget {
  double width = 80;
  double height = 80;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Flow 布局"),
      ),
      body: Flow(
        delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
        children: <Widget>[
          Container(
            width: width,
            height: height,
            color: Colors.red,
          ),
          Container(
            width: width,
            height: height,
            color: Colors.green,
          ),
          Container(
            width: width,
            height: height,
            color: Colors.blue,
          ),
          Container(
            width: width,
            height: height,
            color: Colors.yellow,
          ),
          Container(
            width: width,
            height: height,
            color: Colors.brown,
          ),
          Container(
            width: width,
            height: height,
            color: Colors.purple,
          ),
        ],
      ),
    );
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;

  TestFlowDelegate({this.margin});

  @override
  void paintChildren(FlowPaintingContext context) {
    // TODO: implement paintChildren
    var x = margin.left;
    var y = margin.top;
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    // TODO: implement getSize
    return Size(double.infinity, 300.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate != this;
  }
}
