import 'package:flutter/material.dart';

class Tip2 extends StatefulWidget {
  Tip2() : super();

  final String title = "Tip Demo";

  @override
  Tip2State createState() => Tip2State();
}

class Tip2State extends State<Tip2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: AbsorbPointer(
          absorbing: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              RaisedButton(
                child: Text("Click Me"),
                onPressed: () {},
              ),
              RaisedButton(
                child: Text("Click Me"),
                onPressed: () {},
              ),
              RaisedButton(
                child: Text("Click Me"),
                onPressed: () {},
              )
            ],
          ),
        ));
  }
}
