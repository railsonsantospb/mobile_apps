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
        child: Center(
          child: Text(
            "Hello Flutter",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        decoration: BoxDecoration(
          gradient: getCustomGradient(),
        ),
      ),
    );
  }

  LinearGradient getCustomGradient() {
    return LinearGradient(
      colors: [Colors.pink, Colors.blueAccent],
      begin: const FractionalOffset(0.0, 0.0),
      end: const FractionalOffset(0.8, 0.0),
      stops: [0.0, 0.6],
      tileMode: TileMode.clamp,
    );
  }
}
