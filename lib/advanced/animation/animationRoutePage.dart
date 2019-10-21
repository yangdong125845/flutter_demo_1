import 'package:flutter/material.dart';

import 'animation_structure/animationStructureRoutePage.dart';

class AnimationRoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("动画"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return AnimationStructureRoutePage();
              }));
            },
            child: Text("动画"),
          ),
        ],
      ),
    );
  }
}
