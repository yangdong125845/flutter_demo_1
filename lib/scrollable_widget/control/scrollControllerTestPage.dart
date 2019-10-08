import 'package:flutter/material.dart';

class ScrollControllerTestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new ScrollControllerTestPageState();
}

class ScrollControllerTestPageState extends State<ScrollControllerTestPage> {
  ScrollController _controller = new ScrollController();
  bool showToTopBtn = false; //是否显示"返回到顶部"按钮

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //监听滚动事件，打印滚动位置
    _controller.addListener(() {
      print(_controller.offset); //打印滚动位置
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    //为了避免内存泄漏，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("滚动控制"),
      ),
      body: Scrollbar(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("$index"),
            );
          },
          itemCount: 100,
          itemExtent: 50.0, //列表高度固定时，显示指定高度是一个好习惯（性能消耗小）
          controller: _controller,
        ),
      ),
      floatingActionButton: !showToTopBtn
          ? null
          : FloatingActionButton(
              onPressed: () {
                //返回到顶部时执行动画
                _controller.animateTo(.0,
                    duration: Duration(milliseconds: 200),
                    curve: Curves.bounceInOut);
              },
              child: Icon(Icons.arrow_upward),
            ),
    );
  }
}
