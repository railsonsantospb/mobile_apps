import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  MyHomePage() : super();

  final String title = "Service Call Demo";

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = 'No Data';
  bool isLoading = false;

  void callService() async {
    setState(() {
      isLoading = true;
    });
    print("Calling Service...");

    try {
      final response =
          await http.get("https://jsonplaceholder.typicode.com/todos/1");
      if (response.statusCode == 200) {
        print(response.body);
        final parsed = json.decode(response.body);
        print(parsed["id"]);
        print(parsed["title"]);
        setState(() {
          title = parsed["title"];
        });
      } else {
        print("Error");
        setState(() {
          title = "Error Occurred";
        });
      }
    } catch (e) {
      setState(() {
        title = e.toString();
      });
    }

    setState(() {
      isLoading = false;
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
            isLoading
                ? CircularProgressIndicator()
                : Text(
                    title,
                  ),
            RaisedButton(
              child: Text("Call Service"),
              onPressed: callService,
            )
          ],
        ),
      ),
    );
  }
}
