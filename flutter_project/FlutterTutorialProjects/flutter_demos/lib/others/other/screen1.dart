import 'package:flutter/material.dart';
import 'screen2.dart';

class ScreenOne extends StatefulWidget {
  ScreenOne() : super();

  final String title = "Screen One";

  @override
  _ScreenOneState createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  void goToNextPage(BuildContext context) {
    Navigator.push(
        context,
        new MaterialPageRoute(
            fullscreenDialog: true,
            builder: (BuildContext context) => new ScreenTwo("Screen Two")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.green,
        alignment: Alignment.center,
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: "image1",
              child: ClipOval(
                child: Image.asset(
                  "images/flutter.jpg",
                  alignment: Alignment.center,
                  width: 200,
                  height: 200,
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            OutlineButton(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "Show Full Image",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                goToNextPage(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
