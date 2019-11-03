import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PlatformViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("PlatformViewPage"),
      ),
      body: WebView(
        initialUrl: "https://flutter-io.cn/",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
