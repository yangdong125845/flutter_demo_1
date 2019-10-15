import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'DialogCheckbox.dart';
import 'showCustomDialog.dart';

//showBottomSheet 有点问题(Issue)
class DialogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("DialogPage"),
      ),
      body: SingleChildScrollView(
        child: Center(
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
              RaisedButton(
                onPressed: () async {
                  //弹出删除确认对话框，等待用户确认
                  bool deleteTree = await showDeleteConfirmDialog3(context);
                  if (deleteTree == null) {
                    print("取消删除");
                  } else {
                    print("同时删除子目录 ：$deleteTree");
                  }
                },
                child: Text("对话框3 （复选框可点击）"),
              ),
              RaisedButton(
                onPressed: () async {
                  //弹出删除确认对话框，等待用户确认
                  bool deleteTree = await showDeleteConfirmDialog4(context);
                  if (deleteTree == null) {
                    print("取消删除");
                  } else {
                    print("同时删除子目录 ：$deleteTree");
                  }
                },
                child: Text("对话框4 （复选框可点击）"),
              ),
              RaisedButton(
                onPressed: () async {
                  //弹出删除确认对话框，等待用户确认
                  bool deleteTree = await showDeleteConfirmDialog5(context);
                  if (deleteTree == null) {
                    print("取消删除");
                  } else {
                    print("同时删除子目录 ：$deleteTree");
                  }
                },
                child: Text("对话框5 （复选框可点击）"),
              ),
              RaisedButton(
                onPressed: () async {
                  int type = await _showModalBottomSheet(context);
                  print(type);
                },
                child: Text("显示底部菜单列表"),
              ),
              RaisedButton(
                onPressed: () {
                  _showBottomSheet(context);
                },
                child: Text("显示全屏底部菜单列表"),
              ),
              new RaisedButton(
                onPressed: () {
                  showBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return _showNomalWid(context);
                      });
                },
                child: Text("showBottomSheet的使用"),
              ),
              RaisedButton(
                onPressed: () async {
                  showLoadingDialog(context);
                },
                child: Text("Loading框"),
              ),
              RaisedButton(
                onPressed: () async {
                  showLoadingDialog1(context);
                },
                child: Text("大小可变的Loading框"),
              ),
              RaisedButton(
                onPressed: () async {
                  _showDatePicker1(context);
                },
                child: Text("Material风格的日历选择器"),
              ),
              RaisedButton(
                onPressed: () async {
                  _showDatePicker2(context);
                },
                child: Text("iOS风格的日历选择器"),
              ),
            ],
          ),
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

  Widget _buildMaterialDialogTransitions(BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    //使用缩放动画
    return ScaleTransition(
      scale: CurvedAnimation(parent: animation, curve: Curves.easeOut),
      child: child,
    );
  }

  Future<bool> showDeleteConfirmDialog3(BuildContext context) {
    bool _withTree = false; // 记录复选框是否选中
    return showDialog(
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
                    Text("同时删除子目录？"),
                    DialogCheckbox(
                      value: _withTree, //默认不选中
                      onChanged: (bool value) {
                        //更新选中状态
                        _withTree = !_withTree;
                      },
                    )
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
                    //将选中状态返回
                    Navigator.of(context).pop(_withTree);
                  },
                  child: Text("删除"))
            ],
          );
        });
  }

  Future<bool> showDeleteConfirmDialog4(BuildContext context) {
    bool _withTree = false; // 记录复选框是否选中
    return showDialog(
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
                    Text("同时删除子目录？"),
                    //使用StatefulBuilder来构建StatefulWidget上下文
                    StatefulBuilder(builder: (context, _setState) {
                      return Checkbox(
                          value: _withTree, //默认不选中
                          onChanged: (bool value) {
                            //_setState方法实际就是该StatefulWidget的setState方法
                            //调用后builder方法会重新被调用
                            _setState(() {
                              //更新选中状态
                              _withTree = !_withTree;
                            });
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
                    //将选中状态返回
                    Navigator.of(context).pop(_withTree);
                  },
                  child: Text("删除"))
            ],
          );
        });
  }

  Future<bool> showDeleteConfirmDialog5(BuildContext context) {
    bool _withTree = false;
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
                    Text("同时删除子目录?"),
                    Checkbox(
                      //依然使用CheckBox组件
                        value: _withTree,
                        onChanged: (bool value) {
                          //此时context为对话框UI的根Element,我们
                          // 直接将对话框UI对应的 Element标记为dirty
                          (context as Element).markNeedsBuild();
                          _withTree = !_withTree;
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
                    Navigator.of(context).pop(_withTree);
                  },
                  child: Text("删除"))
            ],
          );
        });
  }

  //弹出底部菜单列表模态对话框
  Future<int> _showModalBottomSheet(BuildContext context) {
    return showModalBottomSheet<int>(
        context: context,
        builder: (BuildContext context) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text("$index"),
                onTap: () => Navigator.of(context).pop(index),
              );
            },
            itemCount: 30,
          );
        });
  }

  //返回的是一个controller
  PersistentBottomSheetController<int> _showBottomSheet(BuildContext context) {
    return showBottomSheet<int>(
        context: context,
        builder: (BuildContext context) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text("$index"),
                onTap: () {
                  // do something
                  print("$index");
                  Navigator.of(context).pop();
                },
              );
            },
            itemCount: 30,
          );
        });
  }

  //返回的是一个controller
  PersistentBottomSheetController<int> _showBottomSheet1(BuildContext context) {
    return Scaffold.of(context).showBottomSheet<int>((BuildContext context) {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("$index"),
            onTap: () {
              // do something
              print("$index");
              Navigator.of(context).pop();
            },
          );
        },
        itemCount: 30,
      );
    });
  }

  showLoadingDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false, //点击遮罩不关闭对话框
        builder: (context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircularProgressIndicator(),
                Padding(
                  padding: const EdgeInsets.only(top: 26.0),
                  child: Text("正在加载，请稍后..."),
                )
              ],
            ),
          );
        });
  }

  showLoadingDialog1(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false, //点击遮罩不关闭对话框
        builder: (context) {
          return UnconstrainedBox(
            constrainedAxis: Axis.vertical,
            child: SizedBox(
              width: 280,
              child: AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CircularProgressIndicator(
                      value: .8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 26.0),
                      child: Text("正在加载，请稍后..."),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future<DateTime> _showDatePicker1(BuildContext context) {
    var date = DateTime.now();
    return showDatePicker(
        context: context,
        initialDate: date,
        firstDate: date,
        lastDate: date.add(Duration(days: 30)));
  }

  Future<DateTime> _showDatePicker2(BuildContext context) {
    var date = DateTime.now();
    return showCupertinoModalPopup(
        context: context,
        builder: (ctx) {
          return SizedBox(
            height: 200,
            child: CupertinoDatePicker(
              onDateTimeChanged: (DateTime value) {
                print(value);
              },
              mode: CupertinoDatePickerMode.dateAndTime,
              minimumDate: date,
              maximumDate: date.add(Duration(days: 30)),
              maximumYear: date.year + 1,
            ),
          );
        });
  }

  Widget _showNomalWid(BuildContext context) {
    return new Container(
//      height: 320.0,
//      color: Colors.greenAccent,
      child: new GridView.builder(
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, mainAxisSpacing: 5.0, childAspectRatio: 1.0),
        itemBuilder: (BuildContext context, int index) {
          return new Column(
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.fromLTRB(0.0, 6.0, 0.0, 6.0),
                child: new Image.asset(
                  'images/portrait.png}',
                  width: 50.0,
                  height: 50.0,
                  fit: BoxFit.fill,
                ),
              ),
              new Text("分享")
            ],
          );
        },
        itemCount: 30,
      ),
    );
  }
}
