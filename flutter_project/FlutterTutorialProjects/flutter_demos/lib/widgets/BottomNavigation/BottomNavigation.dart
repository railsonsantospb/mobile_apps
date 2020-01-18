import 'package:flutter/material.dart';
import 'Tabs/FirstTab.dart';
import 'Tabs/SecondTab.dart';
import 'Tabs/ThirdTab.dart';

class BottomNavigationDemo extends StatefulWidget {
  BottomNavigationDemo() : super();

  final String title = "Bottom Navigation";

  @override
  BottomNavigationDemoState createState() => BottomNavigationDemoState();
}

class BottomNavigationDemoState extends State<BottomNavigationDemo>
    with SingleTickerProviderStateMixin {
  //

  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Navigation"),
      ),
      body: TabBarView(
        children: <Widget>[
          FirstTab(),
          SecondTab(),
          ThirdTab(),
        ],
        controller: controller,
      ),
      bottomNavigationBar: Material(
        color: Colors.blue,
        child: TabBar(
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.favorite),
            ),
            Tab(
              icon: Icon(Icons.add),
            ),
            Tab(
              icon: Icon(Icons.airport_shuttle),
            ),
          ],
          controller: controller,
        ),
      ),
    );
  }
}
