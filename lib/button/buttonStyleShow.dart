import 'package:flutter/material.dart';

class ButtonStyleShow extends StatelessWidget {
  ButtonStyleShow({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ButtonStyle"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new RaisedButton(
              onPressed: () {},
              child: Text("RaisedButton"),
            ),
            new FlatButton(
              onPressed: () {},
              child: Text("FlatButton"),
            ),
            new OutlineButton(
              onPressed: () {},
              child: Text("OutlineButton"),
            ),
            new IconButton(
              icon: Icon(Icons.access_alarm),
              onPressed: () {},
            ),
            RaisedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.account_box),
              label: Text("联系人  RaisedButton"),
            ),
            FlatButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add_a_photo),
              label: Text("相机  FlatButton"),
            ),
            new OutlineButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add_location),
              label: Text("定位  OutlineButton"),
            ),
            FlatButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text("Submit"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              onPressed: () {},
            ),
            RaisedButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text("Submit"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
