import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final String title;
  final Color color; //背景颜色

  NavBar({Key key, this.color, this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      constraints: BoxConstraints(
        minHeight: 52,
        minWidth: double.infinity,
      ),
      decoration: BoxDecoration(color: color, boxShadow: [
        //阴影
        BoxShadow(
          color: Colors.black26,
          offset: Offset(0, 3),
          blurRadius: 3,
        )
      ]),
      child: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color:
                color.computeLuminance() < 0.5 ? Colors.white : Colors.black),
      ),
      alignment: Alignment.center,
    );
  }
}
