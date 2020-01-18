import 'package:flutter/material.dart';

class BottomSheetDemo extends StatefulWidget {
  BottomSheetDemo() : super();

  final String title = "Widget Border Demo";

  @override
  _BottomSheetDemoState createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {

  final _scaffoldKey = GlobalKey<ScaffoldState>(); 
  PersistentBottomSheetController controller;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          RaisedButton(
            child: Text("Show BottomSheet"),
            onPressed: (){
              showBottomSheet(context);
            },
          ),
          RaisedButton(
            child: Text("Close"),
            onPressed: (){
controller.close();
            },
          ),
        ],
      ),
    );
  }

  showBottomSheet(BuildContext context){
  //   showModalBottomSheet<void>(context: context,
  //   builder: (BuildContext context) {
  //     return new Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: <Widget>[
  //         new ListTile(
  //           leading: new Icon(Icons.music_note),
  //           title: new Text('Music'),
  //           onTap: () => {}          
  //         ),
  //         new ListTile(
  //           leading: new Icon(Icons.photo_album),
  //           title: new Text('Photos'),
  //           onTap: () => {}          
  //         ),
  //         new ListTile(
  //           leading: new Icon(Icons.videocam),
  //           title: new Text('Video'),
  //           onTap: () => {}          
  //         ),
  //       ],
  //     );
  //  });

 controller = _scaffoldKey.currentState
    .showBottomSheet<Null>((BuildContext context) {
  return new Container(
    color: Colors.green,
      child: new Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      new Padding(
          padding: const EdgeInsets.all(30.0),
          child: new Text(
            'Persistent header for bottom bar!',
            textAlign: TextAlign.left,
          ),),
      new Text(
        'Then here there will likely be some other content '
            'which will be displayed within the bottom bar',
        textAlign: TextAlign.left,
      ),
      SizedBox(
        height: 100,
      ),
    ],
  ));
});

  }
  
}
