import 'package:flutter/material.dart';

class GridViewExtentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("GridViewExtentPage"),
      ),
      body: GridView.extent(
        maxCrossAxisExtent: 100.0,
        childAspectRatio: 2.0,
        children: <Widget>[
          Icon(Icons.ac_unit),
          Icon(Icons.airport_shuttle),
          Icon(Icons.all_inclusive),
          Icon(Icons.beach_access),
          Icon(Icons.map),
          Icon(Icons.fast_rewind)
        ],
      ),
    );
  }
}
