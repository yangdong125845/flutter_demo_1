import 'package:flutter/material.dart';

class TextFieldPage1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _TextFieldState1();
}

class _TextFieldState1 extends State<TextFieldPage1> {
  TextEditingController _uNameController = TextEditingController();
  TextEditingController _selectionController = TextEditingController();

  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  void initState() {
    super.initState();
    _uNameController.addListener(() {
      print("controller: $_uNameController.text");
    });

    _selectionController.text = "Hello world!";
    _selectionController.selection = TextSelection(
        baseOffset: 2, extentOffset: _selectionController.text.length);

    focusNode1.addListener(() {
      print("focusNode1.hasFocus: $focusNode1.hasFocus");
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("输入框"),
      ),
      body: new Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              autofocus: true,
              focusNode: focusNode1,
              decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  prefixIcon: Icon(Icons.person)),
              controller: _uNameController,
            ),
            TextField(
              focusNode: focusNode2,
              decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "您的登录密码",
                  prefixIcon: Icon(Icons.lock)),
              obscureText: true,
              onChanged: (value) {
                print("onChange: $value");
              },
            ),
            TextField(
              controller: _selectionController,
            ),
            Theme(
                data: Theme.of(context).copyWith(
                    hintColor: Colors.teal, //定义下划线颜色
                    primaryColor: Colors.teal,
                    inputDecorationTheme: InputDecorationTheme(
                        labelStyle: TextStyle(color: Colors.red), //定义label字体样式
                        hintStyle: TextStyle(
                            color: Colors.amber, fontSize: 14.0) //定义提示字体样式
                        )),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                          labelText: "用户名1",
                          hintText: "用户名或邮箱1",
                          prefixIcon: Icon(Icons.person)),
                    ),
                    TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          labelText: "密码1",
                          hintText: "您的登录密码1",
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 13.0)),
                      obscureText: true,
                    ),
                  ],
                )),
            Container(
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "电子邮件地址",
                  prefixIcon: Icon(Icons.email),
                  border: InputBorder.none, //隐藏下划线
                ),
              ),
              decoration: BoxDecoration(
                  //下划线浅灰色，宽度1像素
                  border: Border(
                      bottom: BorderSide(color: Colors.grey[200], width: 1.0))),
            )
          ],
        ),
      ),
    );
  }
}
