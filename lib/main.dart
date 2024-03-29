import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_app_1/i10n/localization_intl.dart';
import 'package:flutter_app_1/state_manage/parentWidget.dart';
import 'package:flutter_app_1/state_manage/parentWidgetC.dart';
import 'package:flutter_app_1/state_manage/tapboxA.dart';
import 'package:flutter_app_1/text/textStyleShow.dart';
import 'package:flutter_app_1/advanced/event_handing_and_notification/pointer_event/listenerPage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'advanced/event_handing_and_notification/gesture_detector/bothDirectionPage.dart';
import 'advanced/event_handing_and_notification/gesture_detector/drag.dart';
import 'advanced/event_handing_and_notification/gesture_detector/dragVertical.dart';
import 'advanced/event_handing_and_notification/gesture_detector/gestureConflictListenerPage.dart';
import 'advanced/event_handing_and_notification/gesture_detector/gestureConflictPage.dart';
import 'advanced/event_handing_and_notification/gesture_detector/gestureDetectorPage.dart';
import 'advanced/event_handing_and_notification/gesture_detector/gestureRecognizerPage.dart';
import 'advanced/event_handing_and_notification/gesture_detector/scaleStatePage.dart';
import 'advanced/event_handing_and_notification/notification/listViewNotificationListenerPage.dart';
import 'advanced/event_handing_and_notification/notification/notificationPage.dart';
import 'advanced/event_handing_and_notification/notification/notificationRoutePagePreventBubble.dart';
import 'advanced/internationalized/internationizedPage.dart';
import 'button/buttonStyleShow.dart';
import 'container/box/constrainedBoxPage.dart';
import 'container/clip/clipPage.dart';
import 'container/containerPage.dart';
import 'container/decoratedBox/decoratedBoxPage.dart';
import 'container/padding/paddingPage.dart';
import 'container/scaffoldPage/galleryDemo.dart';
import 'container/scaffoldPage/galleryDemo1.dart';
import 'container/transform/transformPage.dart';
import 'echoRoute.dart';
import 'functional_widget/FutureBuilder/futureBuilderPage.dart';
import 'functional_widget/FutureBuilder/streamBuilderPage.dart';
import 'functional_widget/dialog/dialogPage.dart';
import 'functional_widget/dialog/errorDeleteDialog.dart';
import 'functional_widget/inherited_widget/InheritedWidgetPage.dart';
import 'functional_widget/inherited_widget/outSidePage.dart';
import 'functional_widget/provider/cart/ProviderRoutePage.dart';
import 'functional_widget/provider/cart/ProviderRoutePage1.dart';
import 'functional_widget/provider/cart/optimize/ProviderRoutePage2.dart';
import 'functional_widget/theme/testNavBarPage.dart';
import 'functional_widget/theme/themePage.dart';
import 'functional_widget/will_pop_scope/WillPopScopePage.dart';
import 'image_icon/iconShow.dart';
import 'image_icon/imageIconShow.dart';
import 'progress_indicator/progressIndicatorPage.dart';
import 'radio_check/radioCheckPage.dart';
import 'route_page/mainPage.dart';
import 'scrollable_widget/control/scrollControllerTestPage.dart';
import 'scrollable_widget/control/scrollControllerTestPage1.dart';
import 'scrollable_widget/control/scrollNotificationPage.dart';
import 'scrollable_widget/custom_scroll_view/customScrollViewPage.dart';
import 'scrollable_widget/grid_view/gridViewBuilderPage.dart';
import 'scrollable_widget/grid_view/gridViewCountPage.dart';
import 'scrollable_widget/grid_view/gridViewExtentPage.dart';
import 'scrollable_widget/grid_view/gridViewFixedCrossAxisPage.dart';
import 'scrollable_widget/grid_view/gridViewMaxCrossAxisPage.dart';
import 'scrollable_widget/list_view/infiniteListViewPage.dart';
import 'scrollable_widget/list_view/listViewFlexPage.dart';
import 'scrollable_widget/list_view/listViewIsuePage.dart';
import 'scrollable_widget/list_view/listViewPage.dart';
import 'scrollable_widget/list_view/listViewBuilderPage.dart';
import 'scrollable_widget/list_view/listViewSeparatedPage.dart';
import 'scrollable_widget/list_view/listViewSizedBoxPage.dart';
import 'scrollable_widget/single_child_scrollview/singleChildScrollViewPage.dart';
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

var cameras;

void main() async {
  //获取可用摄像头列表，cameras为全局变量
  cameras = await availableCameras();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      onGenerateTitle: (context) {
        //此时context在Localizations的子树中
        return DemoLocalizations
            .of(context)
            .title;
      },
      title: "Flutter Demo",
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "new_page": (context) => InternationalizedPage(),
      },
      home: new MyHomePage(
        title: "Flutter Demo Home Page",
      ),
      localizationsDelegates: [
        //本地化的代理类
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        //注册我们的Delegate()
        DemoLocalizationsDelegate()
      ],
      supportedLocales: [
        const Locale('en', 'US'), //美国英语
        const Locale("zh", "CN"), //中文简体
        //其他Locales
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
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
                Navigator.of(context)
                    .pushNamed("new_page", arguments: "hi,EchoRoute");
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
      _counter++;
    });
  }
}
