import 'package:flutter/material.dart';

class SplashDemo extends StatefulWidget {
  SplashDemo() : super();

  final String title = "Splash Demo";

  @override
  SplashDemoState createState() => SplashDemoState();
}

class SplashDemoState extends State<SplashDemo> {
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Center(
          child: Text('Custom Splash Screen'),
        ),
      ),
    );
  }
}
