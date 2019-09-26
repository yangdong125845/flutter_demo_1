import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_app_1/state_manage/parentWidget.dart';
import 'package:flutter_app_1/state_manage/parentWidgetC.dart';
import 'package:flutter_app_1/state_manage/tapboxA.dart';
import 'package:flutter_app_1/text/textStyleShow.dart';
import 'button/buttonStyleShow.dart';
import 'container/box/constrainedBoxPage.dart';
import 'container/decoratedBox/decoratedBoxPage.dart';
import 'container/padding/paddingPage.dart';
import 'container/transform/transformPage.dart';
import 'echoRoute.dart';
import 'image_icon/iconShow.dart';
import 'image_icon/imageIconShow.dart';
import 'progress_indicator/progressIndicatorPage.dart';
import 'radio_check/radioCheckPage.dart';
import 'switchAndCheckBoxTestRoute.dart';
import 'textfield_form/formPage.dart';
import 'textfield_form/textFieldPage.dart';
import 'textfield_form/textFieldPage1.dart';
import 'widget_layout/align/alignPage.dart';
import 'widget_layout/align/alignPage1.dart';
import 'widget_layout/align/alignPage2.dart';
import 'widget_layout/align/centerPage.dart';
import 'widget_layout/flex/flexWidget.dart';
import 'widget_layout/linear/linearWidget.dart';
import 'widget_layout/linear/linearWidget1.dart';
import 'widget_layout/flex/flexPage.dart';
import 'widget_layout/flex/flowPage.dart';
import 'widget_layout/stack_positioned/stackPage.dart';
import 'widget_layout/stack_positioned/stackPage1.dart';
import 'widget_layout/wrap_flow/wrapPage.dart';

void main()  => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp (
      title: "Flutter Demo",
      theme: new ThemeData(
        primarySwatch:Colors.blue,
      ),

      routes: {
        "new_page": (context) => TransformPage(),
      },
      home: new MyHomePage(title: "Flutter Demo Home Page",),
    );
  }

}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key,this.title}) :super(key:key);
  final String title;

  @override
  State<StatefulWidget> createState() => new _MyHomePageState();

}

class RandomWordsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
 final wordPair = new WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Text(wordPair.toString()),
    );
  }
  
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              "You have pushed the button this many times: ",
            ),
            new Text(
              "$_counter",
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              child: Text("Open new route"),
              textColor: Colors.blue,
              onPressed: () {
//                Navigator.push(context, new MaterialPageRoute(builder: (context)=> new NewRoute())); //第一种方法
//                Navigator.pushNamed(context, "new_page");
                Navigator.of(context).pushNamed("new_page",arguments: "hi,EchoRoute");
              },
            ),
            RandomWordsWidget(),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
      tooltip: "Increment",
      child: new Icon(Icons.add),
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter ++;
    });
  }

}