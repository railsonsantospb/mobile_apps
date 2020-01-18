import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NativeDemoScreen extends StatefulWidget {
  @override
  _NativeDemoScreenState createState() => _NativeDemoScreenState();
}

class _NativeDemoScreenState extends State<NativeDemoScreen> {
  String message = "No Message from Native";
  static const platform = const MethodChannel("MyChannel");

  // This method calls the native function
  Future<void> callNative() async {
    var params = <String, dynamic>{"from": "Flutter"};
    String messageFromNative = "No Message from Native";
    try {
      messageFromNative =
          await platform.invokeMethod("myNativeFunction", params);
      print(messageFromNative);
    } on PlatformException catch (e) {
      print("error " + e.details);
      messageFromNative = e.details;
    }
    setState(() {
      message = messageFromNative;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Native Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(message),
            RaisedButton(
              child: Text("Call Native Function"),
              onPressed: callNative,
            )
          ],
        ),
      ),
    );
  }
}
