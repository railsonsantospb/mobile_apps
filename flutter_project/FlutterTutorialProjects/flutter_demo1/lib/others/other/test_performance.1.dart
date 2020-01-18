import 'package:flutter/material.dart';

class Demo1 extends StatefulWidget {
  Demo1() : super();

  final String title = "Flutter demo";

  @override
  _Demo1State createState() => _Demo1State();
}

class _Demo1State extends State<Demo1> {
  int counter = 0;

  updateCounter() {
    setState(() {
      counter = counter + 1;
    });
  }

  Widget _buildNonsenseWidget() {
    print("Building...");
    return Container(
      child: Column(
        children: [
          Text('Hello'),
          Column(
            children: [
              Text('Widget 1'),
              Text('Widget 2'),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Row(
        children: [
          Text('Counter: $counter'),
          const _NonsenseWidget(),
          RaisedButton(
            child: Text("test"),
            onPressed: updateCounter,
          )
        ],
      ),
    );
  }
}

class _NonsenseWidget extends StatelessWidget {
  const _NonsenseWidget();

  @override
  Widget build(BuildContext context) {
    print("b2");
    return Container(
      child: Column(
        children: [
          Text('Hello'),
          Column(
            children: [
              Text('Widget 1'),
              Text('Widget 2'),
            ],
          ),
        ],
      ),
    );
  }
}
