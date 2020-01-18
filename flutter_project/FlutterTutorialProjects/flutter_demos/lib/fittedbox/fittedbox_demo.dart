import 'package:flutter/material.dart';

class FittedBoxDemo extends StatefulWidget {
  FittedBoxDemo() : super();

  final String title = "Demo App";

  @override
  _FittedBoxDemoState createState() => _FittedBoxDemoState();
}

class _FittedBoxDemoState extends State<FittedBoxDemo> {
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
              "Flutter Fitted Box Demo",
            ),
            ConstrainedBox(
              constraints: new BoxConstraints(
                minHeight: 100.0,
                minWidth: 100.0,
                maxHeight: 100.0,
                maxWidth: 100.0,
              ),
              child: ConstrainedBox(
                constraints: new BoxConstraints(
                  minHeight: 400.0,
                  minWidth: 20.0,
                  maxHeight: 400.0,
                  maxWidth: 20.0,
                ),
                child: new DecoratedBox(
                  decoration: new BoxDecoration(color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
