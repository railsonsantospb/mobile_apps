import 'package:flutter/material.dart';

class Demo1 extends StatefulWidget {
  Demo1() : super();

  final String title = "Flutter demo";

  @override
  _Demo1State createState() => _Demo1State();
}

class _Demo1State extends State<Demo1> {
  int counter = 0;

  incrementCounter() {
    setState(() {
      counter = counter + 1;
    });
  }

  Widget buildWidget() {
    print("Building Widget");
    return Container(
      child: Column(
        children: <Widget>[
          Text("Hello"),
          Text("World"),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("Rendering....");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Row(
        children: <Widget>[
          Text('Counter $counter'),
          const MyWidget(),
          RaisedButton(
            child: Text("Increment Counter"),
            onPressed: incrementCounter,
          )
        ],
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget();
  @override
  Widget build(BuildContext context) {
    print("Rendering MyWidget");
    return Container(
      child: Column(
        children: <Widget>[
          Text("Hello"),
          Text("World"),
        ],
      ),
    );
  }
}
