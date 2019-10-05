import 'package:flutter/material.dart';

class ListViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          const Text('I\'m dedicating every day to you '),
          const Text('Domentic life was never quite my style'),
          const Text('When you smile, you knock me out,I fall apart'),
          const Text('And I thought I was so smart')
        ],
      ),
    );
  }
}
