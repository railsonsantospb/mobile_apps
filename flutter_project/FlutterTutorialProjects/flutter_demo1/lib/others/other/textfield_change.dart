import 'package:flutter/material.dart';

class TFChange extends StatefulWidget {
  final String title = "TextField Text Listener Demo";

  @override
  _TFChangeChange createState() => _TFChangeChange();
}

class _TFChangeChange extends State<TFChange> {
  final myController = TextEditingController();

  textListener() {
    print("Current Text is ${myController.text}");
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    myController.addListener(textListener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: "Name",
                hintText: "Enter name",
              ),
              onChanged: (text) {
                print("Text $text");
              },
            ),
            // TextField(
            //   controller: myController,
            // )
          ],
        ),
      ),
    );
  }
}
