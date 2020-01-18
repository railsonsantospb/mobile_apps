import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart';
import 'models.dart';
import 'services.dart';

class JSONDemo extends StatefulWidget {
  JSONDemo() : super();

  final String title = "JSON Parse Demo";

  @override
  _JSONDemoState createState() => _JSONDemoState();
}

class _JSONDemoState extends State<JSONDemo> {
  //
  Future<String> loadPersonFromAssets() async {
    return await rootBundle.loadString('json/person.json');
  }

  Future loadPerson() async {
    String jsonString = await loadPersonFromAssets();
    final jsonResponse = json.decode(jsonString);
    Person person = new Person.fromJson(jsonResponse);
    print('Name: ${person.name}');
    print('Places: ${person.places}');
    print('Images: ${person.images[0].name}');
    print('Address: ${person.address.details.town}');

    print("Loading Photos...");
    Services.getPhotos().then((albums) {
      print('Albums: ${albums.length}');
      print('Album 0: ${albums[3].title}');
    });
  }

  @override
  void initState() {
    super.initState();
    loadPerson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
    );
  }
}
