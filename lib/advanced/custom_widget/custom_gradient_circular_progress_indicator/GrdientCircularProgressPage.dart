import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_1/advanced/custom_widget/turnbox/TurnBox.dart';

import 'GradientCircularProgressIndicator.dart';

class GradientCircularProgressPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GradientCircularProgressPageState();
}

class GradientCircularProgressPageState
    extends State<GradientCircularProgressPage> with TickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 3));
    bool isForward = true;
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        isForward = true;
      } else if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
        if (isForward) {
          _animationController.reverse();
        } else {
          _animationController.forward();
        }
      } else if (status == AnimationStatus.reverse) {
        isForward = false;
      }
    });

    _animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("GradientCircularProgressPage"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AnimatedBuilder(
                  animation: _animationController,
                  builder: (BuildContext context, Widget child) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Column(
                        children: <Widget>[
                          Wrap(
                            spacing: 10.0,
                            runSpacing: 16.0,
                            children: <Widget>[
                              GradientCircularProgressIndicator(
                                // No gradient
                                colors: [Colors.blue, Colors.blue],
                                radius: 50.0,
                                strokeWidth: 3.0,
                                value: _animationController.value,
                              ),
                              GradientCircularProgressIndicator(
                                colors: [Colors.red, Colors.orange],
                                radius: 50.0,
                                strokeWidth: 3.0,
                                value: _animationController.value,
                              ),
                              GradientCircularProgressIndicator(
                                radius: 50.0,
                                colors: [Colors.red, Colors.orange, Colors.red],
                                strokeWidth: 5.0,
                                value: _animationController.value,
                              ),
                              GradientCircularProgressIndicator(
                                radius: 50.0,
                                colors: [Colors.teal, Colors.cyan],
                                strokeWidth: 5.0,
                                strokeCapRound: true,
                                value: CurvedAnimation(
                                        parent: _animationController,
                                        curve: Curves.decelerate)
                                    .value,
                              ),
                              TurnBox(
                                turns: 1 / 8,
                                child: GradientCircularProgressIndicator(
                                  radius: 50.0,
                                  colors: [
                                    Colors.red,
                                    Colors.orange,
                                    Colors.red
                                  ],
                                  strokeWidth: 5.0,
                                  strokeCapRound: true,
                                  backgroundColor: Colors.red[50],
                                  totalAngle: 1.5 * pi,
                                  value: CurvedAnimation(
                                          parent: _animationController,
                                          curve: Curves.ease)
                                      .value,
                                ),
                              ),
                              RotatedBox(
                                quarterTurns: 1,
                                child: GradientCircularProgressIndicator(
                                  radius: 50.0,
                                  colors: [Colors.blue[700], Colors.blue[200]],
                                  strokeWidth: 3.0,
                                  strokeCapRound: true,
                                  backgroundColor: Colors.transparent,
                                  value: _animationController.value,
                                ),
                              ),
                              GradientCircularProgressIndicator(
                                radius: 50.0,
                                colors: [
                                  Colors.red,
                                  Colors.amber,
                                  Colors.cyan,
                                  Colors.green[200],
                                  Colors.blue,
                                  Colors.red
                                ],
                                strokeWidth: 5.0,
                                strokeCapRound: true,
                                value: _animationController.value,
                              )
                            ],
                          ),
                          GradientCircularProgressIndicator(
                            radius: 100.0,
                            colors: [Colors.blue[700], Colors.blue[200]],
                            strokeWidth: 20.0,
                            value: _animationController.value,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: GradientCircularProgressIndicator(
                              radius: 100.0,
                              colors: [Colors.blue[700], Colors.blue[300]],
                              strokeWidth: 20.0,
                              value: _animationController.value,
                              strokeCapRound: true,
                            ),
                          ),

                          //剪裁半圆
                          ClipRect(
                            child: Align(
                              alignment: Alignment.topCenter,
                              heightFactor: .5,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: SizedBox(
                                  //width:100.0,
                                  child: TurnBox(
                                    turns: .75,
                                    child: GradientCircularProgressIndicator(
                                      radius: 100.0,
                                      colors: [Colors.teal, Colors.cyan[500]],
                                      strokeWidth: 8.0,
                                      value: _animationController.value,
                                      totalAngle: pi,
                                      strokeCapRound: true,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 104.0,
                            width: 200.0,
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Positioned(
                                  child: TurnBox(
                                    turns: .75,
                                    child: GradientCircularProgressIndicator(
                                      radius: 100.0,
                                      colors: [Colors.teal, Colors.cyan[500]],
                                      strokeWidth: 8.0,
                                      value: _animationController.value,
                                      totalAngle: pi,
                                      strokeCapRound: true,
                                    ),
                                  ),
                                  height: 200.0,
                                  top: .0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Text(
                                    "${(_animationController.value * 100).toInt()} %",
                                    style: TextStyle(
                                        fontSize: 25.0, color: Colors.blueGrey),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
