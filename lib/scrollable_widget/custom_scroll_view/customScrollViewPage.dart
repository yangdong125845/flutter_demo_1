import 'package:flutter/material.dart';

class CustomScrollViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          //AppBar,包含一个导航栏
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text("Demo"),
              background: Image.asset(
                "./images/portrait.png",
                fit: BoxFit.cover,
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: new SliverGrid(
              //Grid

              delegate: new SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                //创建子widget
                return new Container(
                  alignment: Alignment.center,
                  color: Colors.cyan[100 * (index % 9)],
                  child: new Text("grid item $index"),
                );
              }, childCount: 20),
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  //Grid按两列显示
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 4.0),
            ),
          ),

          //List
          new SliverFixedExtentList(
              delegate: new SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                //创建列表项
                return new Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * index % 9],
                  child: new Text("list item $index"),
                );
              }, childCount: 50 //50个列表项
                  ),
              itemExtent: 50),
        ],
      ),
    );
  }
}
