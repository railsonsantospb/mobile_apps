import 'package:flutter/material.dart';

class ScreenTwo extends StatefulWidget {
  ScreenTwo(this.title) : super();

  final String title;

  @override
  _ScreenTwoState createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(40.0),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Hero(
              tag: "image1",
              child: Container(
                height: 800.0,
                width: 800.0,
                child: Image.asset(
                  "images/flutter.jpg",
                  width: 800,
                  height: 800,
                ),
              ),
            ),
            OutlineButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Icon(Icons.close),
            )
          ],
        ),
      ),
    );
  }
}
