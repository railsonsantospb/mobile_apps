import 'package:flutter/material.dart';

class Tip3 extends StatefulWidget {
  Tip3() : super();

  final String title = "Transform Demo";

  @override
  Tip3State createState() => Tip3State();
}

class Tip3State extends State<Tip3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[],
      ),
    );
  }
}
