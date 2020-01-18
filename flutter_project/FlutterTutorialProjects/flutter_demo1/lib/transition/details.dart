import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen() : super();

  final String title = "Details";

  @override
  DetailsScreenState createState() => DetailsScreenState();
}

class DetailsScreenState extends State<DetailsScreen> {
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
            child: Image.asset(
              "images/flutter.jpg",
              width: 800,
              height: 800,
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          OutlineButton(
            child: Icon(Icons.close),
            padding: EdgeInsets.all(20.0),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    ));
  }
}
