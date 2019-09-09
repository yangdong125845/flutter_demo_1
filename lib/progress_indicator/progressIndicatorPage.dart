import 'package:flutter/material.dart';

class ProgressIndicatorPage extends StatefulWidget {
  ProgressIndicatorPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _ProgressIndicatorPageState();
}

class _ProgressIndicatorPageState extends State<ProgressIndicatorPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    _animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animationController.forward();
    _animationController.addListener(() => setState(() => {}));
//    _animationController.addListener(() {
//      setState(() {
//
//      });
//    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("进度指示器"),
      ),
      body: new Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            ),
            LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
              value: .5,
            ),
            CircularProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            ),
            CircularProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
              value: .5,
            ),
            SizedBox(
              height: 3,
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: .5,
              ),
            ),
            SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: .7,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor:
                    ColorTween(begin: Colors.amber[50], end: Colors.amber[900])
                        .animate(_animationController), //从灰色变成蓝色
                value: _animationController.value,
              ),
            )
          ],
        ),
      ),
    );
  }
}
