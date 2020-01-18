import 'package:flutter/material.dart';

class NavigationDrawerDemo extends StatefulWidget {
  NavigationDrawerDemo() : super();

  final String title = "Navigation Drawer Demo";

  @override
  _NavigationDrawerDemoState createState() => _NavigationDrawerDemoState();
}

class _NavigationDrawerDemoState extends State<NavigationDrawerDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "images/flutter.jpg",
                    width: 80,
                    height: 80,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("test@gmail.com"),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            ListTile(
              leading: Icon(Icons.photo),
              title: Text("Photos"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.photo_album),
              title: Text("Photo Album"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.video_library),
              title: Text("Video Library"),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
    );
  }
}
