import 'package:flutter/material.dart';

class GridViewBuilderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _GridViewBuilderState();
}

class _GridViewBuilderState extends State<GridViewBuilderPage> {
  List<IconData> _icons = []; //保存Icon数据

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _retrieveIcons();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("GridViewBuilderPage"),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, //每行三列
            childAspectRatio: 1.0 //显示区域宽高相等
            ),
        itemBuilder: (context, index) {
          //如果显示到最后一个并且Icon总数小于200时继续获取数据
          if (index == _icons.length - 1 && _icons.length < 200) {
            _retrieveIcons();
          }
          return Icon(_icons[index]);
        },
        itemCount: _icons.length,
      ),
    );
  }

  void _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
//      setState(() {
//        _icons.addAll([
//          Icons.add_a_photo,
//          Icons.business,
//          Icons.dashboard,
//          Icons.email,
//          Icons.home,
//          Icons.tab,
//          Icons.face
//        ]);

      _icons.addAll([
        Icons.add_a_photo,
        Icons.business,
        Icons.dashboard,
        Icons.email,
        Icons.home,
        Icons.tab,
        Icons.face
      ]);
      setState(() {});
    });
  }
}
