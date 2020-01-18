import 'package:flutter/material.dart';

class ConatinerTipDemo extends StatefulWidget {
  ConatinerTipDemo() : super();

  final String title = "Widget Border Demo";

  @override
  _ConatinerTipDemoState createState() => _ConatinerTipDemoState();
}

class _ConatinerTipDemoState extends State<ConatinerTipDemo> {
  
  Widget myWidget1() {
    return 
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        color: Colors.white,
        width: double.infinity,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Text("Widget 1"),
          ),
        ),
      ),
    );
  }

  Widget myWidget2(){
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(20.0),
      color: Colors.white,
      alignment: Alignment.center,
      child: Text("Widget 2"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          myWidget1(),
          myWidget2()
        ],
      ),
    );
  }
}
