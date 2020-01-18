import 'package:flutter/material.dart';
import 'SecondScreen.dart';
import 'ScreenArguments.dart';

class FirstScreen extends StatelessWidget {
  //
  static String routeId = 'first_screen';

  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerMessage = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Builder(
        builder: (context) => Column(
          children: <Widget>[
            TextField(
              controller: _controllerTitle,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(15.0),
                hintText: 'Enter Title',
              ),
            ),
            TextField(
              controller: _controllerMessage,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(15.0),
                hintText: 'Enter Message',
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            OutlineButton(
              child: Text('Launch Second Screen'),
              onPressed: () {
                buttonTap1(context);
              },
            ),
            OutlineButton(
              child: Text('Launch Second Screen (Named)'),
              onPressed: () {
                buttonTap2(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  buttonTap1(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SecondScreen(),
        settings: RouteSettings(
          arguments: ScreenArguments(
            _controllerTitle.text,
            _controllerMessage.text,
          ),
        ),
      ),
    );
    showSnackBar(context, result);
  }

  buttonTap2(BuildContext context) async {
    final result = await Navigator.pushNamed(
      context,
      SecondScreen.routeId,
      arguments: ScreenArguments(
        _controllerTitle.text,
        _controllerMessage.text,
      ),
    );
    showSnackBar(context, result);
  }

  showSnackBar(context, result) {
    if (null == result || result.toString().isEmpty) {
      return;
    }
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text('$result'),
        ),
      );
  }
}
