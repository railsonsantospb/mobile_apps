import 'package:flutter/material.dart';

class AlertDemo extends StatefulWidget {
  final String title = "Alert Dialog Demo";

  @override
  AlertDemoState createState() => AlertDemoState();
}

class AlertDemoState extends State<AlertDemo> {
  Future<void> show() async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("This is the title"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("This is the first message"),
                  Text("This is the second message"),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  print("OK Pressed");
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("CANCEL"),
                onPressed: () {
                  print("CANCEL Pressed");
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
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
            OutlineButton(
              child: Text("Show Dialog"),
              onPressed: () {
                show();
              },
            ),
          ],
        ),
      ),
    );
  }
}
