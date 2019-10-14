import 'package:flutter/material.dart';
import 'showCustomDialog.dart';

class DialogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("DialogPage"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
                onPressed: () async {
                  //弹出对话框并等待其关闭
                  bool delete = await showDeleteConfirmDialog(context);
                  if (delete == null) {
                    print("取消删除");
                  } else {
                    print("已确认删除");
                  }
                },
                child: Text("AlertDialog")),
            RaisedButton(
              onPressed: () async {
                changeLanguage(context);
              },
              child: Text("SimpleDialog"),
            ),
            RaisedButton(
              onPressed: () async {
                showListDialog(context);
              },
              child: Text("ShowListDialog"),
            ),
            RaisedButton(
              onPressed: () async {
                showCustomDialog<bool>(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("提示"),
                        content: Text("您确定要删除当前文件吗?"),
                        actions: <Widget>[
                          FlatButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text("取消")),
                          FlatButton(
                              onPressed: () {
                                //执行删除操作
                                Navigator.of(context).pop(true);
                              },
                              child: Text("删除"))
                        ],
                      );
                    });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: const Text("ShowCustomDialog"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> showDeleteConfirmDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示"),
            content: Text("您确定要删除当前文件吗?"),
            actions: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(), //关闭对话框
                  child: Text("取消")),
              FlatButton(
                  onPressed: () {
                    //关闭对话框并返回true
                    Navigator.of(context).pop(true);
                  },
                  child: Text("删除"))
            ],
          );
        });
  }

  Future<void> changeLanguage(BuildContext context) async {
    int i = await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text("请选择语言"),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  // 返回1
                  Navigator.pop(context, 1);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text("中文简体"),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  //返回2
                  Navigator.pop(context, 2);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text("美国英语"),
                ),
              ),
            ],
          );
        });
    if (i != null) {
      print("选择了：${i == 1 ? "中文简体" : "美国英语"}");
    }
  }

  Future<void> showListDialog(BuildContext context) async {
    int index = await showDialog(
        context: context,
        builder: (BuildContext context) {
          var child = Column(
            children: <Widget>[
              ListTile(
                title: Text("请选择"),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: 30,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text("$index"),
                          onTap: () => Navigator.of(context).pop(index),
                        );
                      }))
            ],
          );
          // 使用AlertDialog会报错
          //return AlertDialog(content:child);
//          return Dialog(
//            child: child,
//          );

          return UnconstrainedBox(
            constrainedAxis: Axis.vertical,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 280),
              child: Material(
                child: child,
                type: MaterialType.card,
              ),
            ),
          );
        });

    if (index != null) {
      print("点击了：$index");
    }
  }

  Future<T> showCustomDialog<T>({
    @required BuildContext context,
    bool barrierDismissible = true,
    WidgetBuilder builder,
  }) {
    final ThemeData theme = Theme.of(context, shadowThemeOnly: true);
    return showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        final Widget pageChild = Builder(builder: builder);
        return SafeArea(child: Builder(builder: (BuildContext context) {
          return theme != null
              ? Theme(
                  data: theme,
                  child: pageChild,
                )
              : pageChild;
        }));
      },

      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black87,
      //自定义遮罩颜色
      transitionDuration: const Duration(milliseconds: 150),
      transitionBuilder: _buildMaterialDialogTransitions,
    );
  }

  Widget _buildMaterialDialogTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    //使用缩放动画
    return ScaleTransition(
      scale: CurvedAnimation(parent: animation, curve: Curves.easeOut),
      child: child,
    );
  }
}
