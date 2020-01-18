import 'package:flutter/material.dart';
import 'dart:ui';

class BackDropFilterDemo extends StatefulWidget {
  BackDropFilterDemo() : super();

  final String title = "Image Filter Demo";

  @override
  BackDropFilterDemoState createState() => BackDropFilterDemoState();
}

class BackDropFilterDemoState extends State<BackDropFilterDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Stack(
            children: <Widget>[
              Image.asset(
                "images/parrot.jpg",
                width: 400,
                height: 300,
                fit: BoxFit.fill,
              ),
              Positioned(
                top: 10,
                bottom: 150,
                left: 30,
                right: 100,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    color: Colors.black.withOpacity(0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
