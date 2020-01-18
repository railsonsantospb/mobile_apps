import 'package:flutter/material.dart';

class CustomFontDemo extends StatefulWidget {
  CustomFontDemo() : super();

  final String title = "Custom Font Demo";

  @override
  CustomFontDemoState createState() => CustomFontDemoState();
}

class CustomFontDemoState extends State<CustomFontDemo> {
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Font Demo"),
      ),
      body: Container(
        child: Center(
          child: Text(
            "Hello Flutter",
            style: getCustomFontStyle(),
          ),
        ),
      ),
    );
  }

  TextStyle getCustomFontStyle() {
    return const TextStyle(
      color: Colors.blueAccent,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 55.0,
    );
  }
}
