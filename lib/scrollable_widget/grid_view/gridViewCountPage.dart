import 'package:flutter/material.dart';

class GridViewCountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("GridViewCount"),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
        children: <Widget>[
          Icon(Icons.ac_unit),
          Icon(Icons.airport_shuttle),
          Icon(Icons.all_out),
          Icon(Icons.beenhere),
          Icon(Icons.cached),
          Icon(Icons.fast_rewind)
        ],
      ),
    );
  }
}
