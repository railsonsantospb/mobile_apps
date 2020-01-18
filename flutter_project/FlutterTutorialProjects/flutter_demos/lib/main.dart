import 'package:flutter/material.dart';
import 'Routes/FirstScreen.dart';
import 'Routes/SecondScreen.dart';

void main() {
  runApp(
    new HomeApp(),
  );
}

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: FirstScreen(),
      routes: {
        FirstScreen.routeId: (context) => FirstScreen(),
        SecondScreen.routeId: (context) => SecondScreen(),
      },
      initialRoute: FirstScreen.routeId,
    );
  }
}
