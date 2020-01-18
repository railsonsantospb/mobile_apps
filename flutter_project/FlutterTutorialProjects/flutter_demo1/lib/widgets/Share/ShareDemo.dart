import 'package:flutter/material.dart';
import 'package:share/share.dart';

class ShareDemo extends StatefulWidget {
  @override
  ShareDemoState createState() => ShareDemoState();
}

class ShareDemoState extends State<ShareDemo> {
  //
  String text = '';
  String subject = '';

  share(BuildContext context) {
    final RenderBox box = context.findRenderObject();
    Share.share(text,
        subject: subject,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Share Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Share Demo'),
        ),
        body: Container(
          padding: EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Text',
                  hintText: 'Enter some text or link to share',
                ),
                maxLines: 2,
                onChanged: (String txt) {
                  setState(() {
                    text = txt;
                  });
                },
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Text',
                  hintText: 'Enter some subject to share',
                ),
                maxLines: 2,
                onChanged: (String txt) {
                  setState(() {
                    subject = txt;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              Builder(
                builder: (BuildContext context) {
                  return RaisedButton(
                    child: const Text('Share'),
                    onPressed: text.isEmpty
                        ? null
                        : () {
                            share(context);
                          },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
