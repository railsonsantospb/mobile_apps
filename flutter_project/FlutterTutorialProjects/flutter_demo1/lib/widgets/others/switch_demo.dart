import 'package:flutter/material.dart';

class SwitchDemoScreen extends StatefulWidget {
  SwitchDemoScreen() : super();

  final String title = "Switch App";

  @override
  _SwitchDemoScreenState createState() => _SwitchDemoScreenState();
}

class _SwitchDemoScreenState extends State<SwitchDemoScreen> {
  bool val = false;

  onSwitchValueChanged(bool newVal) {
    setState(() {
      val = newVal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Flutter Switch Demo",
            ),
            Switch(
                value: val,
                onChanged: (newVal) {
                  onSwitchValueChanged(newVal);
                })
          ],
        ),
      ),
    );
  }
}
