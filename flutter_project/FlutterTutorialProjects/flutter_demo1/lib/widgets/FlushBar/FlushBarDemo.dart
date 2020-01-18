import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';

class FlushBarDemo extends StatefulWidget {
  //
  final String title = "FlushBar Demo";
  @override
  FlushBarDemoState createState() => FlushBarDemoState();
}

class FlushBarDemoState extends State<FlushBarDemo> {
  //

  Flushbar flushbar;

  //
  TextEditingController _controller = TextEditingController();
  Flushbar<List<String>> flushbar2;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Form userInputForm;
  String inputVal = '';

  TextFormField getFormField() {
    return TextFormField(
      controller: _controller,
      initialValue: null,
      style: TextStyle(color: Colors.white),
      maxLength: 100,
      maxLines: 1,
      decoration: InputDecoration(
        fillColor: Colors.white12,
        filled: true,
        icon: Icon(
          Icons.label,
          color: Colors.green,
        ),
        border: UnderlineInputBorder(),
        helperText: 'Enter Name',
        helperStyle: TextStyle(color: Colors.grey),
        labelText: 'Type your name',
        labelStyle: TextStyle(color: Colors.grey),
      ),
    );
  }

  withInputField(BuildContext context) async {
    flushbar2 = Flushbar<List<String>>(
      flushbarPosition: FlushbarPosition.BOTTOM,
      flushbarStyle: FlushbarStyle.GROUNDED,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticIn,
      userInputForm: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            getFormField(),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: FlatButton(
                  child: Text('DONE'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.white,
                  textColor: Colors.red,
                  padding: EdgeInsets.all(6.0),
                  onPressed: () {
                    flushbar2.dismiss([_controller.text, ' World']);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    )..show(context).then((result) {
        if (null != result) {
          String userInput1 = result[0];
          String userInput2 = result[1];
          setState(() {
            inputVal = userInput1 + userInput2;
          });
        }
      });
  }

  custom(BuildContext context) {
    flushbar = Flushbar(
      title: 'Hello there',
      message: 'How are you?',
      duration: Duration(seconds: 30),
      flushbarPosition: FlushbarPosition.BOTTOM,
      flushbarStyle: FlushbarStyle.GROUNDED,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticInOut,
      backgroundColor: Colors.red,
      boxShadows: [
        BoxShadow(
          color: Colors.blue[800],
          offset: Offset(0.0, 2.0),
          blurRadius: 3.0,
        ),
      ],
      backgroundGradient: LinearGradient(
        colors: [Colors.blueGrey, Colors.green],
      ),
      isDismissible: false,
      icon: Icon(
        Icons.check,
        color: Colors.yellow,
      ),
      mainButton: FlatButton(
        onPressed: () {
          flushbar.dismiss();
        },
        child: Text(
          'DONE',
          style: TextStyle(color: Colors.white),
        ),
      ),
      showProgressIndicator: true,
      progressIndicatorBackgroundColor: Colors.blueGrey,
    )..show(context);
  }

  normal(BuildContext context) {
    Flushbar(
      title: 'Hello there',
      message: 'How are you?',
      duration: Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.BOTTOM,
      flushbarStyle: FlushbarStyle.GROUNDED,
      onStatusChanged: (FlushbarStatus status) {
        switch (status) {
          case FlushbarStatus.SHOWING:
            {
              print('SHOWING');
              break;
            }
          case FlushbarStatus.IS_APPEARING:
            {
              print('IS_APPEARING');
              break;
            }
          case FlushbarStatus.IS_HIDING:
            {
              print('IS_HIDING');
              break;
            }
          case FlushbarStatus.DISMISSED:
            {
              print('DISMISSED');
              break;
            }
        }
      },
    )..show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlushBar Demo'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            OutlineButton(
              child: Text('Show FlushBar'),
              onPressed: () {
                normal(context);
              },
            ),
            OutlineButton(
              child: Text('Show Custom FlushBar'),
              onPressed: () {
                custom(context);
              },
            ),
            OutlineButton(
              child: Text('Show Custom FlushBar With Input Field'),
              onPressed: () {
                withInputField(context);
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(inputVal),
          ],
        ),
      ),
    );
  }
}
