import 'package:flutter/material.dart';
import 'ScreenArguments.dart';

class SecondScreen extends StatelessWidget {
  //

  static String routeId = 'second_screen';

  final String title;
  final String message;

  SecondScreen({this.title, this.message});

  final TextEditingController _controllerMessageBack = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(null == args ? 'Second Screen' : args.title),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: _controllerMessageBack,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(15.0),
              hintText: 'Enter return message',
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(null == args ? '' : args.message),
          OutlineButton(
            child: Text('Done'),
            onPressed: () {
              Navigator.pop(context, _controllerMessageBack.text);
            },
          ),
        ],
      ),
    );
  }
}
