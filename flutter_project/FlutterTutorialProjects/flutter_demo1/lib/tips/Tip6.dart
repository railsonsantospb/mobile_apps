import 'package:flutter/material.dart';

class Tip5 extends StatefulWidget {
  Tip5() : super();

  final String title = "Tip5 Demo";

  @override
  Tip5State createState() => Tip5State();
}

class Tip5State extends State<Tip5> {
  //
  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Are you sure to exit?"),
          content: new Text("You are going to exit the application"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("NO"),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            new FlatButton(
              child: new Text("YES"),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: Container(),
      ),
    );
  }
}
