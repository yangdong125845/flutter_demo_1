import 'package:flutter/material.dart';

class ErrorDeleteDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _DialogRouteState();
}

class _DialogRouteState extends State<ErrorDeleteDialog> {
  bool withTree = false; //复选框中状态

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("ErrorDeleteDialog"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () async {
              bool delete = await showDeleteConfirmDialog2();
              if (delete == null) {
                print("取消删除");
              } else {
                print("同时删除子目录 :$delete");
              }
            },
            child: Text("对话框2"),
          )
        ],
      ),
    );
  }

  Future<bool> showDeleteConfirmDialog2() {
    withTree = false; // 默认复选框不选中
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示"),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("您确定要删除当前文件吗？"),
                Row(
                  children: <Widget>[
                    Text("同时删除子目录"),
                    Checkbox(
                        value: withTree,
                        onChanged: (bool value) {
                          //复选框选中状态发生变化时重新构建UI
                          setState(() {
                            //更新复选框状态
                            withTree = !withTree;
                          });
                        })
                  ],
                )
              ],
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("取消")),
              FlatButton(
                  onPressed: () {
                    //执行删除操作
                    Navigator.of(context).pop(withTree);
                  },
                  child: Text("删除"))
            ],
          );
        });
  }
}
