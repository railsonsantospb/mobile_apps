import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:async';
import 'dart:io';

class Tip7 extends StatefulWidget {
  //
  Tip7() : super();

  final String title = "Flutter Tips";

  @override
  Tip7State createState() => Tip7State();
}

class Tip7State extends State<Tip7> with SingleTickerProviderStateMixin {
  //
  String fadeImgUrl =
      'https://images.freeimages.com/images/large-previews/322/indian-heads-1391201.jpg';
  String cacheImgUrl =
      'https://images.freeimages.com/images/large-previews/7e9/ladybird-1367182.jpg';

  void periodic() {
    Timer.periodic(
      Duration(seconds: 1),
      (Timer time) {
        print("time: ${time.tick}");
        if (time.tick == 5) {
          time.cancel();
          print('Timer Cancelled');
        }
      },
    );
  }

  void getDevice() {
    bool ios = Platform.isAndroid;
    print('iOS1: $ios');
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    print('iOS2: $isIOS');

    // Do not explicitly initialize variables to null.
    var test; //good
    var test1 = null; // bad
  }

  Widget demoSafeArea() {
    return Container(
      color: Colors.green,
      width: 80.0,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          /*....*/
        ],
      ),
    );
  }

  Widget toolTipWidget() {
    return Tooltip(
      message: "This is a tooltip",
      child: new Text("Long press to see Tooltip"),
    );
  }

  Widget fadeImage() {
    return FadeInImage.assetNetwork(
      placeholder: 'images/loading.gif',
      image: fadeImgUrl,
    );
  }

  Widget cacheImage() {
    return CachedNetworkImage(
      placeholder: (context, url) => CircularProgressIndicator(),
      imageUrl: cacheImgUrl,
    );
  }

  Widget list() {
    List<String> companies = [
      'Google',
      'Facebook',
      'Apple',
      'Google',
      'Facebook',
      'Apple',
      'Google',
      'Facebook',
      'Apple',
      'Google',
      'Facebook',
      'Apple',
      'Google',
      'Facebook',
      'Apple',
      'Google',
      'Facebook',
      'Apple',
      'Google',
      'Facebook',
      'Apple',
      'Google',
      'Facebook',
      'Apple',
    ];
    return Expanded(
      child: ListView.builder(
        itemCount: companies.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              companies[index],
              style: TextStyle(color: Colors.black),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //getDevice();
    periodic();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // body: Container(
      //   padding: EdgeInsets.all(20.0),
      //   child: Center(
      //     child: list(),
      //   ),
      // ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            list(),
          ],
        ),
      ),
    );
  }
}
