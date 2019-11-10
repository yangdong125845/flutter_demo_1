import 'package:flutter/material.dart';

import 'internationizedPage.dart';

class InternationalizedRoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("AcvancedRoutePage"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return InternationalizedPage();
              }));
            },
            child: Text("实现Localizations"),
          ),
        ],
      ),
    );
  }
}
