import 'package:flutter/material.dart';
import 'custom_button.dart';

class CustomWidgetDemo extends StatefulWidget {
  CustomWidgetDemo() : super();

  final String title = "Custom Widget Demo";

  @override
  _CustomWidgetDemoState createState() => _CustomWidgetDemoState();
}

class _CustomWidgetDemoState extends State<CustomWidgetDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("We are going to create a custom button"),
            CustomButton(
              onPressed: () {
                print("Tapped Me");
              },
            )
          ],
        ),
      ),
    );
  }
}
