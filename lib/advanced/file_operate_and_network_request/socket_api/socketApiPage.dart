import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class SocketApiPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SocketApiState();
}

class _SocketApiState extends State<SocketApiPage> {
  String _response;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("SocketApi"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            FloatingActionButton(
              onPressed: _request,
              tooltip: "Send Message",
              child: Icon(Icons.send),
            ),
            Text(_response)
          ],
        ),
      ),
    );
  }

  void _request() async {
    //建立连接
    var socket = await Socket.connect("baidu.com", 80);
    //根据http协议，发送请求头
    socket.writeln("GET / HTTP1.1");
    socket.writeln("Host:baidu.com");
    socket.writeln("Connection:Close");
    socket.writeln();
    await socket.flush(); //发送
    //读取返回内容
    //  _response = await socket.transform(utf8.decoder).join();
    setState(() {});
    await socket.close();
  }
}
