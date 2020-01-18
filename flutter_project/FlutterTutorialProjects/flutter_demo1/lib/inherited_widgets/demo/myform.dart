import 'package:flutter/material.dart';
import 'package:flutter_demo1/inherited_widgets/demo/state_container.dart';

class FormScreen extends StatefulWidget {
  @override
  FormScreenState createState() => new FormScreenState();
}

class FormScreenState extends State<FormScreen> {
  String name;
  final formKey = new GlobalKey<FormState>();

  validateAndSave() {
    final container = StateContainer.of(context);

    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      container.updateUser(name: name);
      Navigator.pop(context);
    } else {
      print("Validation Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Flutter Inherited Widget Demo'),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "Name"),
                  validator: (val) => val.length == 0 ? "Enter Name" : null,
                  onSaved: (val) => name = val,
                ),
                RaisedButton(
                  child: Text("Save"),
                  onPressed: validateAndSave,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
