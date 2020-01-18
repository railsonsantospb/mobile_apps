import 'package:flutter/material.dart';
import 'dart:developer';

class DebugAppScene extends StatefulWidget {
  DebugAppScene() : super();

  final String title = "Debug App";

  @override
  _DebugAppSceneState createState() => _DebugAppSceneState();
}

class _DebugAppSceneState extends State<DebugAppScene> {
  demoFunction(String value) {
    print("This is a test function " + value);
    //debugger();
    print("test");
    //debugDumpApp();
  }

  testTime(){
    int num = 0;
    Timeline.startSync('interesting function');
    for(int i = 0; i < 1000; i++){
      num++;
    }
    print('Num $num');
    Timeline.finishSync();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Flutter Debugging",
            ),
            RaisedButton(
              child: Text("Debug App"),
              onPressed: () {
                demoFunction('Hello');
              },
            ),
            RaisedButton(
              child: Text("Test Time"),
              onPressed: () {
                testTime();
              },
            ),
            TextField()
          ],
        ),
      ),
    );
  }
}
