import 'package:flutter/material.dart';

class ListenerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListenerPageState();
}

class _ListenerPageState extends State<ListenerPage> {
  //定义一个状态,保存当前指针位置
  PointerEvent _event;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("ListenerPage"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Listener(
              child: Container(
                alignment: Alignment.center,
                color: Colors.blue,
                width: 300.0,
                height: 150.0,
                child: Text(
                  _event?.toString() ?? "",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onPointerDown: (PointerDownEvent event) =>
                  setState(() => _event = event),
              onPointerMove: (PointerMoveEvent event) =>
                  setState(() => _event = event),
              onPointerUp: (PointerUpEvent event) =>
                  setState(() => _event = event),
            ),
            Listener(
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(Size(300.0, 150.0)),
                child: Center(
                  child: Text("Box A"),
                ),
              ),
              onPointerDown: (event) => print("down A"),
            ),
            Listener(
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(Size(300.0, 150.0)),
                child: Center(
                  child: Text("Box A"),
                ),
              ),
              behavior: HitTestBehavior.opaque,
              onPointerDown: (event) => print("down A"),
            ),
            Stack(
              children: <Widget>[
                Listener(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tight(Size(300.0, 200.0)),
                    child: DecoratedBox(
                        decoration: BoxDecoration(color: Colors.blue)),
                  ),
                  onPointerDown: (event) => print("down0"),
                ),
                Listener(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tight(Size(200.0, 100.0)),
                    child: Center(
                      child: Text("左上角200*100范围内非文本区域点击"),
                    ),
                  ),
                  onPointerDown: (event) => print("down1"),
                  behavior: HitTestBehavior.translucent,
                ),
              ],
            ),
            Listener(
              child: AbsorbPointer(
                child: Listener(
                  child: Container(
                    color: Colors.red,
                    width: 200.0,
                    height: 100.0,
                  ),
                  onPointerDown: (event) => print("in"),
                ),
              ),
              onPointerDown: (event) => print("up"),
            )
          ],
        ),
      ),
    );
  }
}
