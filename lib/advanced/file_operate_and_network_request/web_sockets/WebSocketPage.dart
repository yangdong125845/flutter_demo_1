import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WebSocketState();
}

class _WebSocketState extends State<WebSocketPage> {
  TextEditingController _controller = new TextEditingController();
  IOWebSocketChannel channel;
  String _text = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //创建websocket连接
    channel = new IOWebSocketChannel.connect("ws://echo.websocket.org");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("WebSocket(内容回显)"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(labelText: "Send a message"),
              ),
            ),
            new StreamBuilder(
                stream: channel.stream,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  //网络不通会走到这
                  if (snapshot.hasError) {
                    _text = "网络不通...";
                  } else if (snapshot.hasData) {
                    _text = "echo: " + snapshot.data;
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Text(_text),
                  );
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendMessage,
        tooltip: "Send message",
        child: Icon(Icons.send),
      ),
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      channel.sink.add(_controller.text);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    channel.sink.close();
  }
}
