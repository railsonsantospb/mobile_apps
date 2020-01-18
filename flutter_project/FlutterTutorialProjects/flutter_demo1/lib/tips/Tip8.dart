import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/animation.dart';

class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}

class Tip7 extends StatefulWidget {
  Tip7() : super();

  final String title = "Flutter Tips";

  @override
  Tip7State createState() => Tip7State();
}

class Tip7State extends State<Tip7> with SingleTickerProviderStateMixin {
  //
  Animation<double> animation;
  AnimationController controller;
  String fadeImgUrl =
      'https://images.freeimages.com/images/large-previews/322/indian-heads-1391201.jpg';
  String cacheImgUrl =
      'https://images.freeimages.com/images/large-previews/7e9/ladybird-1367182.jpg';

  final img = FlutterLogo(
    size: 100,
  );

  @override
  void initState() {
    super.initState();
    initAnimation();
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

  initAnimation() {
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addStatusListener((status) {
        if (AnimationStatus.completed == status) {
          controller.reverse();
        } else if (AnimationStatus.dismissed == status) {
          controller.forward();
        }
      })
      ..addStatusListener((state) => print('$state'));
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: cacheImage(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
