import 'package:flutter/material.dart';

class FlutterTips extends StatefulWidget {
  FlutterTips() : super();

  final String title = "Flutter Tips";

  @override
  FlutterTipsState createState() => FlutterTipsState();
}

class FlutterTipsState extends State<FlutterTips> {
  //

  String imgUrl;

  Widget body2() {
    // return Container(
    //   color: Color.fromRGBO(0, 0, 0, 0.5),
    // );
    return Container(
      color: Color(0xFF4286f4).withOpacity(0.5),
    );
  }

  Widget body3() {
    return Container(
      color: Colors.orangeAccent,
      height: 100.0,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.white.withOpacity(0.2),
          onTap: () {
            print("Selected");
          },
          child: Center(
            child: Text("Hello"),
          ),
        ),
      ),
    );
  }

  Widget body1() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        child: Column(
          children: <Widget>[
            TextField(),
          ],
        ),
      ),
    );
  }

  Widget body4() {
    return Container(
      height: 40.0,
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.all(30.0),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
    );
  }

  Widget body5() {
    return Container(
      width: 250.0,
      height: 300.0,
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.all(30.0),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(50.0),
        image: DecorationImage(image: NetworkImage(imgUrl), fit: BoxFit.fill),
      ),
    );
  }

  Widget body6() {
    return ClipOval(
      child: Image.network(
        imgUrl,
        fit: BoxFit.fill,
        width: 200.0,
        height: 200.0,
      ),
    );
  }

  Widget body7() {
    return Container(
      height: 300.0,
      width: 200.0,
      child: CircleAvatar(
        radius: 100.0,
        backgroundImage: NetworkImage(imgUrl),
      ),
    );
  }

  Widget body8() {
    return ListView.separated(
      separatorBuilder: (context, index) => Text("Seperator"),
      itemCount: 25,
      itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.all(20.0),
            child: Center(
              child: Text('Index $index'),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // if (imgUrl == null) {
    //   imgUrl =
    //       'https://images.pexels.com/photos/40984/animal-ara-macao-beak-bird-40984.jpeg?cs=srgb&dl=animal-colorful-colourful-40984.jpg&fm=jpg';
    // }

    imgUrl ??=
        'https://images.pexels.com/photos/40984/animal-ara-macao-beak-bird-40984.jpeg?cs=srgb&dl=animal-colorful-colourful-40984.jpg&fm=jpg';

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.green,
        child: body8(),
      ),
    );
  }
}
