import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  FormScreen();

  @override
  State<StatefulWidget> createState() {
    return _FormScreenState();
  }
}

class _FormScreenState extends State<FormScreen> {
  String name;
  String age;

  final formKey = new GlobalKey<FormState>();

  validateFormAndSave() {
    print("Validating Form...");
    if (formKey.currentState.validate()) {
      print("Validation Successful");
      formKey.currentState.save();
      print('Name $name');
      print('Age $age');
    } else {
      print("Validation Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Flutter Form Demo'),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: new Container(
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                verticalDirection: VerticalDirection.down,
                children: <Widget>[
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: "Name"),
                    validator: (val) => val.length == 0 ? "Enter Name" : null,
                    onSaved: (val) => name = val,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "Age"),
                    validator: (val) => val.length == 0 ? "Enter Age" : null,
                    onSaved: (val) => age = val,
                  ),
                  RaisedButton(
                    child: Text("Save"),
                    onPressed: validateFormAndSave,
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
