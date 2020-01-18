import 'package:flutter/material.dart';

class GradientDemo extends StatefulWidget {
  GradientDemo() : super();

  final String title = "Gradient Demo";

  @override
  _GradientDemoState createState() => _GradientDemoState();
}

class _GradientDemoState extends State<GradientDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Container(
        // Center the content
        child: new Center(
          // Add Text
          child: new Text(
            "Hello World!",
            style: new TextStyle(color: Colors.white),
          ),
        ),
        // Set background
        decoration: new BoxDecoration(
          // Add Gradient
          gradient: getCustomGradient(),
        ),
      ),
    );
  }

  LinearGradient getCustomGradient() {
    // Define a Linear Gradient
    return new LinearGradient(
        colors: [Colors.pink, Colors.blueAccent],
        begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(0.6, 0.0),
        stops: [0.0, 0.6],
        tileMode: TileMode.clamp);
  }
}
