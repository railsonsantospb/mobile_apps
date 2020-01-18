import 'package:flutter/material.dart';
import 'details.dart';

class ScreenOne extends StatefulWidget {
  ScreenOne() : super();

  final String title = "Screen One";

  @override
  _ScreenOneState createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  goToDetails(BuildContext context) {
    Navigator.push(
      context,
      new MaterialPageRoute(
          fullscreenDialog: true,
          builder: (BuildContext context) => new DetailsScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.green,
        padding: EdgeInsets.all(30.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: "image1",
              child: ClipOval(
                child: Image.asset(
                  "images/flutter.jpg",
                  width: 200,
                  height: 200,
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            OutlineButton(
              child: Text(
                "Show Full  Image",
                style: TextStyle(color: Colors.white),
              ),
              padding: EdgeInsets.all(20.0),
              onPressed: () {
                goToDetails(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
